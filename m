From: mcgrof at kernel.org (Luis Chamberlain)
Date: Thu, 14 Mar 2019 14:20:26 +0000
Subject: [PATCH v2] error message found related
In-Reply-To: <CAG=yYwkYwiB1dfDJg=VB_Kd1Hu+i-WrFN8SyKT9hKP55WzyA3w@mail.gmail.com>
References: <20190131183109.10919-1-jeffrin@rajagiritech.edu.in>
 <20190211214002.GV11489@garbanzo.do-not-panic.com>
 <CAG=yYwkYwiB1dfDJg=VB_Kd1Hu+i-WrFN8SyKT9hKP55WzyA3w@mail.gmail.com>
Message-ID: <20190314142026.GE1038@42.do-not-panic.com>

On Thu, Feb 14, 2019 at 11:56:46PM +0530, Jeffrin Thalakkottoor wrote:
> > Your subject is too long.
> ok . i have changed it
> 
> 
> > Please upgrade bash?
> anyway now i have an upgraded one.
> 
> here  is a clipping related to the error
> ---------------------x-------------------x----------------
> Thu Feb 14 23:49:13 IST 2019
> Running test: kmod_test_0007 - run #4
> kmod_test_0005: OK! - loading kmod test
> kmod_test_0005: OK! - Return value: 0 (SUCCESS), expected SUCCESS
> kmod_test_0006: OK! - loading kmod test
> kmod_test_0006: OK! - Return value: 0 (SUCCESS), expected SUCCESS
> ./kmod.sh: line 529: [[: 1 0002:3:1 0003:1:1 0004:1:1 0005:10:1
> 0006:10:1 0007:5:1 0008:150:1 0009:150:1: syntax error in expression
> (error token is "0002:3:1 0003:1:1 0004:1:1 0005:10:1 0006:10:1
> 0007:5:1 0008:150:1 0009:150:1")
> ./kmod.sh: line 529: [[: 1 0002:3:1 0003:1:1 0004:1:1 0005:10:1
> 0006:10:1 0007:5:1 0008:150:1 0009:150:1: syntax error in expression
> (error token is "0002:3:1 0003:1:1 0004:1:1 0005:10:1 0006:10:1
> 0007:5:1 0008:150:1 0009:150:1")
> Test completed
> $

I do not see this at all. Does anyone else see it?

  Luis
