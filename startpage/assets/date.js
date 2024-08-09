function getDate() {
  const now = new Date()

  const formattedDate = now.toLocaleString('en-GB', {
    weekday: 'long',
    day: '2-digit',
    month: 'long',
    year: 'numeric',
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
    hour12: false,
    timeZone: 'Europe/Helsinki'
  })

  document.getElementById('date').innerHTML = formattedDate
}

getDate()
setInterval(getDate, 1000)
