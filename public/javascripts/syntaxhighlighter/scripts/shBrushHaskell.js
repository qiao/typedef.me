/**
 * Haskell Brush for SyntaxHighlighter.
 *
 * @author Michael Rueegg
 *
 * @version 0.0.1 (July 24 2010)
 */

SyntaxHighlighter.brushes.Haskell = function() {
	var keywords = 'as case of class data default deriving do forall '
			+ 'hiding if then else import infix infixl infixr instance let in '
			+ 'module newtype qualified type where';

	var preludeFuns = 'not otherwise maybe either fst snd curry uncurry '
			+ 'compare max min succ pred toEnum fromEnum enumFrom enumFromThen '
			+ 'enumFromTo enumFromThenTo minBound maxBound negate abs signum '
			+ 'fromInteger toRational quot rem div mod quotRem divMod toInteger '
			+ 'recip fromRational pi exp log sqrt logBase sin cos tan asin acos '
			+ 'atan sinh cosh tanh asinh acosh atanh properFraction truncate '
			+ 'round ceiling floor floatRadix floatDigits floatRange decodeFloat '
			+ 'encodeFloat exponent significand scaleFloat isNaN isInfinite '
			+ 'isDenomalized isNegativeZero isIEEE atan2 subtract even odd gcd '
			+ 'lcm fromIntegral realToFrac return fail fmap mapM mapM_ sequence '
			+ 'sequence_ id const flip until asTypeOf error undefined seq map filter '
			+ 'head last tail init null length reverse foldl foldl1 foldr foldr1 '
			+ 'and or any all sum product concat concatMap maximum minimum scanl'
			+ 'scanl1 scanr scanr1 iterate repeat cycle take drop splitAt teakWhile'
			+ 'dropWhile span break elem notElem lookup zip zip3 zipWith zipWith3 '
			+ 'unzip unzip3 lines words unlines unwords showPrec show showList '
			+ 'shows showChar showString showParen readsPrec readList reads readParen '
			+ 'read lex putChar putStr putStrLn print getChar getLine getContents '
			+ 'interact readFile writeFile appendFile readIO readLn ioError userError '
			+ 'catch';

	var keysymbols = '[-+*/=!^$|:%~_><]';

	// Make sure that keywords at the beginning of a line are
	// not highlighted like ordinary function names
	var keywordsArr = keywords.split(" ").concat(preludeFuns.split(" "));
	this.values = new Object();
	this.values.regex = new RegExp('^[a-z]\\w*', 'gm');
	this.values.exec = function(value) {
		m = this.regex.exec(value);
		if (m && m.length)
			for (var j = 0; j < keywordsArr.length; j++)
				if (m[0] == keywordsArr[j])
					m[0] = "";
		return m;
	};

	this.regexList = [ {
		regex : /--(.*)$/gm,
		css : 'comments'
	}, // one line comments
	{
		regex : /{-([\s\S]*)?-}/gm,
		css : 'comments'
	}, // multiline comments
	{
		regex : SyntaxHighlighter.regexLib.doubleQuotedString,
		css : 'string'
	}, // strings
	{
		regex : SyntaxHighlighter.regexLib.singleQuotedString,
		css : 'string'
	}, // characters
	{
		regex : /\b([\d]+(\.[\d]+)?|0x[a-f0-9]+)\b/gi,
		css : 'color1'
	}, // numbers
	{
		regex : /\b[A-Z]\w*\b/gm,
		css : 'variable'
	}, // data types, type classes, constructors
	{
		regex : this.values,
		css : 'color3'
	}, // function names
	{
		regex : new RegExp(this.getKeywords(keywords), 'gm'),
		css : 'keyword'
	}, // keywords
	{
		regex : new RegExp(this.getKeywords(preludeFuns), 'gm'),
		css : 'keyword'
	}, // prelude functions
	{
		regex : new RegExp(keysymbols, 'g'),
		css : 'color2'
	}, // key symbols
	];
};

SyntaxHighlighter.brushes.Haskell.prototype = new SyntaxHighlighter.Highlighter();
SyntaxHighlighter.brushes.Haskell.aliases = ['hs', 'haskell'];
