import React from 'react'
import _ from 'lodash'

/**
 * Returns the face value name of the card given a raw face value.
 * E.g. 10 = 'jack'
 * @param  {number} faceValue Face value of the card, royals are >=10 and ace is 0.
 * @return {string} Processed face value name
 */
const getFaceValueName = (faceValue) => {
  const royalsNames = ['jack', 'queen', 'king']

  if (faceValue == 0) {
    // Ace
    return 'ace'
  } else if (faceValue >= 10) {
    // Royals
    return royalsNames[faceValue - 10]
  } else {
    // Numerical card values start at 2 and are one-based so the name needs the addition
    return (faceValue + 1).toString()
  }
}
/**
 * Returns the file name pattern for the input suit and face value.
 * @param  {string} suit Name of the card's face.
 * @param  {number} faceValue Face value of the card, royals are >10 and ace is 0.
 * @return {filename} Name of the card image file.
 */
const getCardFilename = (suit, faceValue) => {
  // Format is '2_of_spades.svg'
  return `${getFaceValueName(faceValue)}_of_${suit}s`
}

// Card images courtesy of: https://code.google.com/archive/p/vector-playing-cards/
// Loads the images for all 13 cards (0-12) in 4 suits, this method attempts to
// generate an object where the keys are the name of the file as per getCardFilename
// and the values is the actual resource.
const cardImages = _.fromPairs(_.flatMap(['diamond', 'club', 'heart', 'spade'], (suit) => {
  // Generate all cards for each suit
  return _.times(13, (faceValue) => {
    const cardFilename = getCardFilename(suit, faceValue)
    return [
      cardFilename,
      require('./assets/card_images/' + cardFilename + '.svg')
    ]
  })
}))

/**
 * Determines the file to load for the input suit and face.
 * @param  {string} suit Name of the card's face.
 * @param  {number} faceValue Face value of the card, royals are >=10 and ace is 0.
 * @return {imageURL} URL to use for the image, this may point to the image or be a data-url.
 */
const getCardImage = (suit, faceValue) => {
  // Format is '2_of_spades.svg'
  return cardImages[getCardFilename(suit, faceValue)]
}

// Curly braces are destructuring assignment:
// See: https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment
// See: https://stackoverflow.com/a/33705619
const Card = ({suit, faceValue}) => (
  <div>
    <img src={getCardImage(suit, faceValue)} alt={`${getFaceValueName(faceValue)} of ${suit}s`} />
  </div>
)

Card.propTypes = {
  suit: React.PropTypes.string,
  faceValue: React.PropTypes.number
}

export default Card
