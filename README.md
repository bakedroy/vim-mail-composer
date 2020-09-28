# vim-mail-composer

See a [post](https://bakedroy.github.io/2020/09/28/ComposeMailFromVim.html).

I love vim but it is not a email client. To write my email in vim on Windows devices, I created a tiny vimscript code to transfer selected texts to Thunderbird. 

## Installation

- Paste the code into your `vimrc`.
- Modifiy `Path-To-Temp-File` and `Path-To-Thunderbird-Exe` as you wish

## Usage

Select the text you wrote in visual mode, type `,th`, then a composing window of Thunderbid will be appeared.

## ToDo

- Extract to, cc, and subject lines from vim's buffer and fill those field based on the extracted info
- Delete the temporary file after composing finished
