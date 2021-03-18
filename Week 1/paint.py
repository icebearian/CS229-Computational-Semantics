from nltk.grammar import CFG
from nltk.parse import EarleyChartParser
cfg = CFG.fromstring("""
S -> NP VP
NP -> DET NN
NP -> DET NP
NP -> JJ NN
VP -> VB NP
DET -> 'a' | 'the'
JJ -> 'lucky'
NN -> 'man' | 'woman'
VB -> 'loves' | 'shoots'
""")

cfgparser = EarleyChartParser(cfg)

s = 'a man loves a woman'.split()
for tree in cfgparser.parse(s):
    print(tree.pformat())
    tree.draw()
s = 'the man shoots a woman'.split()
for tree in cfgparser.parse(s):
    print(tree.pformat())
    tree.draw()
s = 'a lucky woman loves a man'.split()
for tree in cfgparser.parse(s):
    print(tree.pformat())
    tree.draw()
