From: anton.ivanov@cambridgegreys.com (Anton Ivanov)
Date: Wed, 5 Dec 2018 14:49:10 +0000
Subject: [RFC v3 01/19] kunit: test: add KUnit test runner core
In-Reply-To: <CAK8P3a2HrOTYv7qCJH1XGVxZ2HDqwkHqRWaAJ93nWc5p8LnCig@mail.gmail.com>
References: <20181128193636.254378-1-brendanhiggins@google.com>
 <20181128193636.254378-2-brendanhiggins@google.com>
 <20181130031438.GQ4922@garbanzo.do-not-panic.com>
 <e2ed9df2-c06b-f0d3-d50a-d03166f586df@cambridgegreys.com>
 <CAK8P3a2HrOTYv7qCJH1XGVxZ2HDqwkHqRWaAJ93nWc5p8LnCig@mail.gmail.com>
Message-ID: <5bd5581f-f192-4ed0-6f5f-9e1bf9f443e2@cambridgegreys.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181205144910.qceL9oiwkZgE0qFS-S98gufU2NTAzh_0Q_O2y5dauJY@z>

On 05/12/2018 14:45, Arnd Bergmann wrote:
> On Wed, Dec 5, 2018 at 2:42 PM Anton Ivanov
> <anton.ivanov@cambridgegreys.com> wrote:
>> On 30/11/2018 03:14, Luis Chamberlain wrote:
>>> On Wed, Nov 28, 2018@11:36:18AM -0800, Brendan Higgins wrote:
>>> Then for the UML stuff, I think if we *really* accept that UML will
>>> always be a viable option we should probably consider now throwing these
>>> things under drivers/platform/uml/. This follows the pattern of arch
>>> specific drivers. Whether or not we end up with a complete userspace
>> UML platform drivers predate that and are under arch/um/drivers/
>>
>> We should either keep to current convention or consider relocating the
>> existing ones - having things spread in different places around the tree
>> is not good in the long run (UML already has a few of those under the
>> x86 tree, let's not increase the number).
> I don't mind the current location much, but if we move drivers, we should
> move the into the appropriate subsystems based on what they do, rather
> than having a new place with a mix of things.
>
> E.g. the tty drivers should all be in drivers/tty/ and the network drivers in
> drivers/net. To paraphrase what you said above: having tty drivers spread in
> different places around the tree is not good in the long run. We have long
> ago moved from organizing drivers by bus interface to organizing drivers
> by class, uml and drivers/platform are just exceptions to this rule.

There are some issues with that because uml drivers have bits of what is 
effectively host side of the hypervisor as a part of them. IMHO, having 
that in driver/X is not very appropriate. So at least the *_user.c and 
*_user.h bits have to go (or stay) somewhere else

Brgds,

-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
