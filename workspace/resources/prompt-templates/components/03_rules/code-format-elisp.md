<!-- ---
!-- title: 2024-12-27 23:18:26
!-- author: Yusuke Watanabe
!-- date: /home/ywatanabe/.emacs.d/lisp/llemacs/workspace/resources/prompt-templates/components/03_rules/code-format-elisp.md
!-- --- -->

# Rules: code-elisp-format
* Return only one Elisp code block, using the progn command
* Code must be wrapped with this code block marker: ```elisp\n(progn\nYOUR CODE\n)\n```
* Code must be executable, complete, and evaluatable
* External tools (shell commands, python, latex, and so on) can be accessible as long as your code is written in Elisp