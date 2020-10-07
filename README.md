# vim-mail-composer

See a [post](https://bakedroy.github.io/2020/09/28/ComposeMailFromVim.html).

I love vim but it is not a email client. To write my email in vim on Windows devices, I created a tiny vimscript code to transfer selected texts to Thunderbird. 

## Installation

- Paste the code into your `vimrc`.
- Modify `Path-To-Temp-File` and `Path-To-Thunderbird-Exe` as you wish

## Usage

Select the text you wrote in visual mode, type `,th`, then a composing window of Thunderbird will be appeared.


### Format

Mail format is as follows:
```
Subject: A test mail
Dear John Doe,

...
```

If `subject:XXX` line is set on the top of your selected area, the line is set as the subject of your message.

## ToDo

- Extract to and cc lines from vim's buffer and fill those fields on the composing window based on the extracted info
- Delete the temporary file after composing finished (currently I tried it but removed before the file passed to a mailer)
