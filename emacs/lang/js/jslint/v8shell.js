/*
 * Call jslint from v8 shell and output errors to stdout
 */

var outputErrors = function (errors) {
    var e, i, output = [];
    // debug("Handling " + errors.length + "errors" + '\n');
    function write(s) {
        output.push(s + '\n');
    }
    /* This formatting is copied from JSLint's rhino.js, to be compatible with
       the command-line invocation. */
    for (i = 0; i < errors.length; i += 1) {
        e = errors[i];
        if (e) {
            write('Lint at line ' + e.line + ' character ' +
                        e.character + ': ' + e.reason);
            write((e.evidence || '').
                        replace(/^\s*(\S*(\s+\S+)*)\s*$/, "$1"));
            write('');
        }
    }
    return output.join('');
};

var options = {
      bitwise: false,
      curly: true,
      eqeqeq: true,
      immed:true,
      latedef: true,
      noarg: true,
      plusplus:true,
      regexp:true,
      undef: true,
      unused: true,
      trailing: true,
      maxparams: 5,
      maxdepth: 5,
      maxstatements: 25,
      maxcomplexity: 10,

      evil: true,

      laxcomma: true,

      browser: true,
      node: true,
      devel: true,
      es5: true,
      jquery: true,

      globalstrict: false,
      strict: false,
      boss: false

};
var globals = {
      roundNumber: true,
      roundNumberStr: true,
      _: true,
      JST: true,
      read: true,
      jQuery:true,
      Correlate: true,
      Corr: true,
      Backbone: true,
      JSHINT: true
};

if (!JSHINT(read(input_filename), options, globals)) {
    print(outputErrors(JSHINT.errors));
}
