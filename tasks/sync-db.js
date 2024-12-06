let times = 0;

const syncDB = () => {
    times++;
    console.log('running a task 5 four second', times);

    return times;
}

module.exports = {
    syncDB
}