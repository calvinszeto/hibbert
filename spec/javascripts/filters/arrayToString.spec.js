describe('arrayToString', function () {
    beforeEach(module('constants'));
    beforeEach(module('hibbertApp'));

    it('should convert an array to a string', inject(function ($filter, arrayToStringFilter) {//, arrayToString) {
        expect($filter('arrayToString')).not.toBeNull();
        expect(arrayToStringFilter(['a', 'b', 'c'])).toEqual('a, b, c');
    }));

})