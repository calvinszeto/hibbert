describe('arrayToString', function() {
    beforeEach(angular.mock.module('hibbertApp'));

    it('should convert an array to a string', angular.mock.inject(function(arrayToString) {
        expect(arrayToString(['a', 'b', 'c'])).toEqual('a, b, c');
    }));

})