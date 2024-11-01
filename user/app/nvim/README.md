// mini surround

1. **Surround a word with arentheses**

   - Old text: `surround_words`
     text - hello

   i am the text
   i "am" the text
   i "am" the text
   i am "the" text
   i am the "text"
   "i" am the text
   i am the text
   i am the text
   i am the text
   i am the text
   i am the text
   i am number in which is stacked inside the ide 1 2 3 4 4
   i am number in which is stacked inside the ide 1 2 3 4 4
   i am number in which is stacked inside the ide 1 2 3 4 4
   i am number in which is stacked inside the ide 1 2 3 4 4

   5

   - Command: `ysiw)`
   - New text: `("surround_words")`

2."" **Surround a string with double quotes**

{header}hello i am three </header>

- "Old" text: `make strings`
- "Command": `ys$"`
- New text: `"make strings"`

3. **Delete surrounding square brackets**

   - Old text: `delete around me!`
   - Command: `ds]`
   - New text: `delete around me!`

4. **Remove HTML tags**

   - Old text: `<b>HTML tags</b>`
   - Command: `dst`
   - New text: `HTML tags`

5. **Change single quotes to double quotes**

   - Old text: `'change quotes'`
   - Command: `cs'"`
   - New text: `"change quotes"`

6. **Change HTML tag tye**

   - Old text: `<b>tag types</b>`
   - Command: `csth1<CR>`
   - New text: `<h1>tag types</h1>`

7. **Delete surrounding function call**

   - Old text: `delete(function calls)`
   - Command: `dsf`
   - New text: `function calls`

8. **Surround a word with curly braces**

   - Old text: `curly`
   - Command: `ysiw}`
   - New text: `{curly}`

9. **Surround a sentence with square brackets**

   - Old text: `surround this sentence`
   - Command: `ys$]`
   - New text: `[surround this sentence]`

10. **Change surrounding parentheses to curly braces**
    - Old text: `(change this)`
    - Command: `cs{`
    - New text: `change this`
