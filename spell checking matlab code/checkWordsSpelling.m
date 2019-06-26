 function wordsChecked = checkWordsSpelling( words )
    %
    %   Based on Mathworks thread:
    %   http://www.mathworks.com/matlabcentral/answers/91885-is-there-any-way-to-check-spelling-from-within-matlab
    %
    % - Split space-separated words into cell array of words, or wrap
    %  single word into cell array.
    if ischar( words )
        if any( words == ' ' )
            words = strsplit( words, ' ' ) ;
        else
            words = {words} ;
        end
    end
    % - Launch MS Word and create document.
    h = actxserver( 'word.application' ) ;
    h.Document.Add ;
    % - Build cell array of originals and suggestions.
    words  = words(:) ;      % -> columns cell array.
    nWords = numel( words ) ;
    for wId = 1 : nWords
        % - Check if spelling correct. Loop back if so.
        isCorrect    = h.CheckSpelling( words{wId,1} ) ;
        words{wId,2} = isCorrect ;
        if isCorrect
            words{wId,3} = false ;
            continue ;
        end
        % - Build cell array of suggestions.
        nSug = h.GetSpellingSuggestions( words{wId,1} ).count;
        words{wId,3} = nSug > 0 ;
        if nSug > 0
            for sId = 1 : nSug
                words{wId,4}{sId} = ...
                    h.GetSpellingSuggestions( words{wId,1} ).Item(sId).get( 'name' ) ;
            end
        end
    end
    % - Quit MS Word.
    h.Quit
    % - Build table (or struct array if you prefer).
    %wordsChecked = cell2struct( words, {'original', 'isCorrect', 'hasSuggestion', 'suggestion'}, 2 ) ;
    wordsChecked = cell2table( words, 'VariableNames', {'original', 'isCorrect', 'hasSuggestion', 'suggestion'} ) ;        
 end