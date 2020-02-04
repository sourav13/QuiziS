//
//  Questions.swift
//  QuiziS
//
//  Created by sourav sachdeva on 04/02/20.
//  Copyright © 2020 sourav sachdeva. All rights reserved.
//

import Foundation
class Questions{
      var questions = [Question]()
    func loadRespectiveQuestions(selectedGrammarType:Int)->[Question]{
          switch(selectedGrammarType){
              case 0: questions = Grammar.grammar(grammarType: GrammarType.prepositions.rawValue)
              case 1: questions = Grammar.grammar(grammarType: GrammarType.irregularverbs.rawValue)
              case 2: questions = Grammar.grammar(grammarType: GrammarType.adjectivesandadverbs.rawValue)
              case 3: questions = Grammar.grammar(grammarType: GrammarType.countableanduncountables.rawValue)
              case 4: questions = Grammar.grammar(grammarType: GrammarType.infinitivesorgerunds.rawValue)
              case 5: questions = Grammar.grammar(grammarType: GrammarType.moreorless.rawValue)
              case 6: questions = Grammar.grammar(grammarType: GrammarType.expressionsofcolor.rawValue)
              case 7: questions = Grammar.grammar(grammarType: GrammarType.fewandlittle.rawValue)
              case 8: questions = Grammar.grammar(grammarType: GrammarType.adverbialclauses.rawValue)
              case 9: questions = Grammar.grammar(grammarType: GrammarType.modals.rawValue)
              case 10: questions = Grammar.grammar(grammarType:GrammarType.linkers.rawValue)
              case 11: questions = Grammar.grammar(grammarType:GrammarType.conjunctions.rawValue)
              default: questions = Grammar.grammar(grammarType:GrammarType.prepositions.rawValue)
          }
        return questions
      }    
      func loadRespectiveWords(selectedGrammarType:Int)->[Question]{
          
          switch(selectedGrammarType){
             case 0: questions = Grammar.grammar(grammarType: WordType.foodAndRestaurants.rawValue)
             case 1: questions = Grammar.grammar(grammarType: WordType.smallTalk.rawValue)
             case 2: questions = Grammar.grammar(grammarType: WordType.travelAndGettingAround.rawValue)
             case 3: questions = Grammar.grammar(grammarType: WordType.hobbies.rawValue)
             case 4: questions = Grammar.grammar(grammarType: WordType.idioms.rawValue)
             case 5: questions = Grammar.grammar(grammarType: WordType.expressYourself.rawValue)
             case 6: questions = Grammar.grammar(grammarType: WordType.filmsTvInternet.rawValue)
             case 7: questions = Grammar.grammar(grammarType: WordType.atWork.rawValue)
             case 8: questions = Grammar.grammar(grammarType: WordType.takingItEasy.rawValue)
             case 9: questions = Grammar.grammar(grammarType: WordType.shopping.rawValue)
             default: questions = Grammar.grammar(grammarType:WordType.foodAndRestaurants.rawValue)
          }
        return questions
      }
      func getCurrentQuestion(currentQuestion:Int)->Question?{
          if questions.isEmpty{
              return nil
          }else{
              return questions[currentQuestion]
          }
      }
      
}
