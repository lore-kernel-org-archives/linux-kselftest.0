From: torvalds@linux-foundation.org (Linus Torvalds)
Date: Mon, 6 May 2019 09:19:35 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <CAHk-=wgw_Jmn1iJWanoSFb1QZn3mbTD_JEoMsWcWj5QPeyHZHA@mail.gmail.com>
References: <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
 <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
 <20190502185225.0cdfc8bc@gandalf.local.home>
 <20190502193129.664c5b2e@gandalf.local.home>
 <20190502195052.0af473cf@gandalf.local.home>
 <20190503092959.GB2623@hirez.programming.kicks-ass.net>
 <20190503092247.20cc1ff0@gandalf.local.home>
 <2045370D-38D8-406C-9E94-C1D483E232C9@amacapital.net>
 <CAHk-=wjrOLqBG1qe9C3T=fLN0m=78FgNOGOEL22gU=+Pw6Mu9Q@mail.gmail.com>
 <20190506081951.GJ2606@hirez.programming.kicks-ass.net>
 <20190506095631.6f71ad7c@gandalf.local.home>
 <CAHk-=wgw_Jmn1iJWanoSFb1QZn3mbTD_JEoMsWcWj5QPeyHZHA@mail.gmail.com>
Message-ID:
 <CAHk-=wjs8hhEdLUb=rD1tZC-JzBHALpi0hQSNf=esw96Gnta6A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190506161935.ZBK6B0DI4EFRHvSomiXhjJLDHjMUcUxBZmFwNucntKM@z>

On Mon, May 6, 2019 at 9:17 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So what is it that doesn't actually work? I've looked at the patch
> even more, and I can't for the life of me see how it wouldn't work.

And I do still react to PeterZ's

 arch/x86/entry/entry_32.S            | 150 +++++++++++++++++++++++++++++------

vs

 arch/x86/entry/entry_32.S            |  7 ++++++-

for mine. And PeterZ's  apparently still had bugs.

Yes, mine can have bugs too, but I really *have* done some basic
testing, and with 6 lines of code, I think they are more localized.

                Linus
