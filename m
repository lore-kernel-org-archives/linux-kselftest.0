From: luto@amacapital.net (Andy Lutomirski)
Date: Thu, 2 May 2019 13:25:56 -0700
Subject: [RFC][PATCH 1/2] x86: Allow breakpoints to emulate call functions
In-Reply-To: <nycvar.YFH.7.76.1905022101060.10635@cbobk.fhfr.pm>
References: <20190501202830.347656894@goodmis.org>
 <20190501203152.397154664@goodmis.org>
 <20190501232412.1196ef18@oasis.local.home>
 <20190502162133.GX2623@hirez.programming.kicks-ass.net>
 <CAHk-=wijZ-MD4g3zMJ9W2r=h8LUWneiu29OWuxZEoSfAF=0bhQ@mail.gmail.com>
 <20190502181811.GY2623@hirez.programming.kicks-ass.net>
 <CAHk-=wi6A9tgw=kkPh5Ywqt687VvsVEjYXVkAnq0jpt0u0tk6g@mail.gmail.com>
 <nycvar.YFH.7.76.1905022101060.10635@cbobk.fhfr.pm>
Message-ID: <D87B1B37-C06B-4C81-BF82-994B03DE2BFF@amacapital.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190502202556.2ntqz00-3n1TuzpRpPGjBVLwKjRVtNG6fJzRBD9ExWQ@z>



> On May 2, 2019,@12:28 PM, Jiri Kosina <jikos@kernel.org> wrote:
> 
>> On Thu, 2 May 2019, Linus Torvalds wrote:
>> 
>> I forget: is #BP _only_ for the "int3" instruction? 
> 
> Hmm, according to 17.3.2 in vol 3 of SDM (and table 6-1 there), that 
> indeed seems to be the case, so we should be fine.

I’m reasonably confident that the absurd MOV SS; INT3 sequence results in #BP from user mode and then #DB inside that (as opposed to vice versa), so this should be okay.
