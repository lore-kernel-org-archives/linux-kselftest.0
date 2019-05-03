From: peterz@infradead.org (Peter Zijlstra)
Date: Fri, 3 May 2019 18:32:55 +0200
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <2045370D-38D8-406C-9E94-C1D483E232C9@amacapital.net>
References: <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
 <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
 <20190502202146.GZ2623@hirez.programming.kicks-ass.net>
 <20190502185225.0cdfc8bc@gandalf.local.home>
 <20190502193129.664c5b2e@gandalf.local.home>
 <20190502195052.0af473cf@gandalf.local.home>
 <20190503092959.GB2623@hirez.programming.kicks-ass.net>
 <20190503092247.20cc1ff0@gandalf.local.home>
 <2045370D-38D8-406C-9E94-C1D483E232C9@amacapital.net>
Message-ID: <20190503163255.GG2606@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190503163255.RzyGvHJR8HfEhcbuFBYaaDfvLczNESJDho9sToEgQTk@z>

On Fri, May 03, 2019@09:20:55AM -0700, Andy Lutomirski wrote:
> > On May 3, 2019,@6:22 AM, Steven Rostedt <rostedt@goodmis.org> wrote:
> > 
> > On Fri, 3 May 2019 11:29:59 +0200
> > Peter Zijlstra <peterz@infradead.org> wrote:
> > 
> > 
> >> OMG, WTF, ARGH... That code is fsck'ing horrible. I'd almost argue to
> >> always do the INT3 thing, just to avoid games like that.

> So here’s a somewhat nutty suggestion: how about we tweak the 32-bit
> entry code to emulate the sane 64-bit frame, not just for int3 but
> always? 

Basically what I wrote above, right? I'd be fine with that... Linus?
