From: shuah at kernel.org (shuah)
Date: Sun, 20 Jan 2019 12:28:19 -0700
Subject: [PATCH v1 0/6] seccomp test fixes
In-Reply-To: <CAGXu5jKtQZ5oKethjopCW75eDtj6fEdCANRqah+wUh2pYfdGiQ@mail.gmail.com>
References: <20190119001217.12660-1-tycho@tycho.ws>
 <CAGXu5jKtQZ5oKethjopCW75eDtj6fEdCANRqah+wUh2pYfdGiQ@mail.gmail.com>
Message-ID: <debaac10-04ec-2d59-d2a8-8fce156d5d40@kernel.org>

On 1/19/19 5:43 PM, Kees Cook wrote:
> On Fri, Jan 18, 2019 at 4:12 PM Tycho Andersen <tycho at tycho.ws> wrote:
>>
>> Hi all,
>>
>> Here are the fixes I previously mentioned I would send. I previously
>> assumed that the tests were mostly run as root, but it turns out
>> everything else besides the stuff I wrote in the seccomp tests either
>> sets NNP and doesn't require real root, so it all actually works. This
>> set of fixes should make most of the other tests work unprivileged,
>> while XFAIL-ing the one that requires real root.

Tycho, Thanks for a quick response in fixing the problems.
> 
> Awesome. This all looks good to me. :)
> 
> Acked-by: Kees Cook <keescook at chromium.org>
> 
> Shuah, can you take this series?
> 


Yes. I will take these in for rc5.

thanks,
-- Shuah
