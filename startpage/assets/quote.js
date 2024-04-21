const quotes = [
  {
    "quote": "If a man knows not to which port he sails, no wind is favorable.",
    "author": "Seneca"
  },
  {
    "quote": "People are frugal in guarding their personal property; but as soon as it comes to squandering time they are most wasteful of the one thing in which it is right to be stingy.",
    "author": "Seneca"
  },
  {
    "quote": "We are always complaining that our days are few, and acting as though there would be no end of them.",
    "author": "Seneca"
  },
  {
    "quote": "You are scared of dying, but tell me, is the kind of life you lead really any different from being dead?",
    "author": "Seneca"
  },
  {
    "quote": "The more we value things outside our control, the less control we have.",
    "author": "Epictetus"
  },
  {
    "quote": "It’s not what happens to you, but how you react to it that matters.",
    "author": "Epictetus"
  },
  {
    "quote": "We suffer not from the events in our lives but from our judgements about them.",
    "author": "Epictetus"
  },
  {
    "quote": "We suffer more in imagination than in reality.",
    "author": "Seneca"
  },
  {
    "quote": "To be everywhere is to be nowhere.",
    "author": "Seneca"
  },
  {
    "quote": "Very little is needed to make a happy life; it is all within yourself, in your way of thinking.",
    "author": "Marcus Aurelius"
  },
  {
    "quote": "It is not the man who has too little, but the man who craves too much, who is poor.",
    "author": "Seneca"
  },
  {
    "quote": "Wealth consists not in having many possessions, but in having few wants.",
    "author": "Epictetus"
  },
  {
    "quote": "Until we have begun to go without them, we fail to realize how unnecessary many things are. We've been using them not because we needed them but because we had them.",
    "author": "Seneca"
  },
  {
    "quote": "Do not indulge in dreams of having what you have not, but reckon up the chief of the blessings you do possess, and then thankfully remember how you would crave for them if they were not yours.",
    "author": "Marcus Aurelius"
  },
  {
    "quote": "Learning to live with less will create space in your life for the things that truly matter to you.",
    "author": "Seneca"
  },
  {
    "quote": "How does it help...to make troubles heavier by bemoaning them?",
    "author": "Seneca"
  },
  {
    "quote": "You always own the option of having no opinion. There is never any need to get worked up or to trouble your soul about things you can't control. These things are not asking to be judged by you. Leave them alone.",
    "author": "Marcus Aurelius"
  },
  {
    "quote": "Never let the future disturb you. You will meet it, if you have to, with the same weapons of reason which today arm you against the present.",
    "author": "Marcus Aurelius"
  },
  {
    "quote": "Everything hangs on one’s thinking. A man is as unhappy as he has convinced himself he is.",
    "author": "Seneca"
  },
  {
    "quote": "Today I escaped anxiety. Or no, I discarded it, because it was within me, in my own perceptions, not outside.",
    "author": "Marcus Aurelius"
  },
  {
    "quote": "Any person capable of angering you becomes your master.",
    "author": "Epictetus"
  },
  {
    "quote": "If someone succeeds in provoking you, realize that your mind is complicit in the provocation.",
    "author": "Epictetus"
  },
  {
    "quote": "When you run up against someone else’s shamelessness, ask yourself this: Is a world without shamelessness possible? No. Then don’t ask the impossible. There have to be shameless people in the world. This is one of them.",
    "author": "Marcus Aurelius"
  },
  {
    "quote": "When you wake up in the morning, tell yourself: the people I deal with today will be meddling, ungrateful, arrogant, dishonest, jealous and surly.",
    "author": "Marcus Aurelius"
  },
  {
    "quote": "The best revenge is to be unlike him who performed the injury.",
    "author": "Marcus Aurelius"
  },
  {
    "quote": "Your mind will take the shape of what you frequently hold in thought, for the human spirit is colored by such impressions.",
    "author": "Marcus Aurelius"
  },
  {
    "quote": "You become what you give your attention to ... If you yourself don't choose what thoughts and images you expose yourself to, someone else will, and their motives may not be the highest.",
    "author": "Epictetus"
  },
  {
    "quote": "Be discriminating about what images and ideas you permit into your mind.",
    "author": "Epictetus"
  },
  {
    "quote": "Every night before going to sleep, we must ask ourselves: what weakness did I overcome today? What virtue did I acquire?",
    "author": "Seneca"
  },
  {
    "quote": "A gem cannot be polished without friction, nor a man perfected without trials.",
    "author": "Seneca"
  },
  {
    "quote": "Here is a rule to remember in future, when anything tempts you to feel bitter: not ‘this is misfortune,’ but ‘to bear this worthily is good fortune’.",
    "author": "Marcus Aurelius"
  },
]

function getQuote() {
  const randomQuote = quotes[Math.floor(Math.random() * quotes.length)]
  let quote = "“" + randomQuote.quote + "”" + " — " + randomQuote.author
  document.getElementById('quote').innerHTML = quote.toString()
}

const second = 1000
const minute = 60

getQuote()
setInterval(getQuote, second * minute)

