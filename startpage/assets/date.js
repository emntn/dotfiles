function getDate() {
  const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
  const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']

  const now = new Date()

  let str = days[now.getDay()] + ', ' + ('0' + now.getDate()).slice(-2) + ' ' + months[now.getMonth()] + ' ' + now.getFullYear() + ' ' + ('0' + now.getHours()).slice(-2) + ':' + ('0' + now.getMinutes()).slice(-2) + ':' + ('0' + now.getSeconds()).slice(-2)
  document.getElementById('date').innerHTML = str.toString()
}

getDate()
setInterval(getDate, 1000)
