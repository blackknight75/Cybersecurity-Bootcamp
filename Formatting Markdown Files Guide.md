# Markdown Syntax

## Headers

Use `#` for headers. More `#`s mean smaller headers.

```markdown
# Header 1
## Header 2
### Header 3
#### Header 4
##### Header 5
###### Header 6
```
## Emphasis
- **Bold**: Use double asterisks or underscores.

```markdown
**bold text**
__bold text__
```
- _Italic_: Use single asterisks or underscores.

```markdown
*italic text*
_italic text_
```

- ~~Strikethrough~~ : Use double tildes.
```markdown
~~strikethrough~~
```

## Lists
- Unordered list: Use asterisks, plus signs, or hyphens.

```markdown
- Item 1
- Item 2
  - Subitem 2.1
  - Subitem 2.2
```
- Ordered list: Use numbers followed by periods.

```markdown
1. First item
2. Second item
   1. Subitem 2.1
   2. Subitem 2.2
```
## Links
- Inline link: [Text](URL)

```markdown
[GitHub](https://github.com)
```
- Reference link: Use a reference name in brackets, then define the URL somewhere else in the document.

```markdown
[GitHub][1]

[1]: https://github.com
```
## Images
- Inline image link: ![Alt text](URL)
  
![example](assets/image_example.png)

```markdown
![GitHub Logo](https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png)
```
## Code
- `Inline code`: Use single backticks.

```markdown
`code here`
```

- Code blocks: Use triple backticks or indent with four spaces.

```
    ```
    your code block goes here
    ```
```

- Specify language for syntax highlighting inside code block:

```bash
    ```bash
    echo "Hello Cyber Team"
    ```
```

## Blockquotes
- Use > for blockquotes.
> This is a block quote
```markdown
> This is a blockquote.
```
Horizontal Rules
Use three or more asterisks, hyphens, or underscores.

****
----
____
*all 3 methods create the same line*

```markdown
***
---
___

```
## Tables
- Use pipes | and hyphens - to create tables.

| Header 1 | Header 2 |
|----------|----------|
| row 1    | data 1   |
| row 2    | data 2   |

```markdown
| Header 1 | Header 2 |
|----------|----------|
| row 1    | data 1   |
| row 2    | data 2   |
```

## Task Lists
- Use - [ ] and - [x] for task lists.

- [ ] Task 1
- [x] Task 2 (completed)

```markdown
- [ ] Task 1
- [x] Task 2 (completed)
```

## Escaping Markdown Characters
 - Use the backslash `\` to escape Markdown characters.

```markdown
\*Not italic*\ and \**not bold**
```


    
***This guide covers the basics, but Markdown has many more features and variations depending on the platform (GitHub, GitLab, etc.). Refer to specific platform documentation for advanced usage.***
