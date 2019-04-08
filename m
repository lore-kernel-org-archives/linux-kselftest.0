From: shuah at kernel.org (shuah)
Date: Mon, 8 Apr 2019 11:08:06 -0600
Subject: TAP 13 output format
In-Reply-To: <CAGXu5jLzyjtkF4Z1Rm7rsp85EiEmTqyLFcgXYPWEgxGVuprG9w@mail.gmail.com>
References: <CAGXu5jLzyjtkF4Z1Rm7rsp85EiEmTqyLFcgXYPWEgxGVuprG9w@mail.gmail.com>
Message-ID: <2aa1eeb7-f12d-a5fc-e929-c30846c1fbee@kernel.org>

On 4/8/19 10:46 AM, Kees Cook wrote:
> Hi,
> 
> I'm working on writing a LKDTM selftest, and I noticed that the output
> format for the existing selftest tests don't seem to actually conform
> to the TAP 13 specification[1]. Namely, there is a ton of output
> between the "ok" and "not ok" lines, in various places for various
> reasons. IIUC, the spec says these lines should follow the "ok" lines
> and be (at least) indented to be parsed as YAML.
> 
> How does the existing CI do the selftest output parsing? Is there some
> other spec I should have read for the correct interpretation here?
> (TAP 13 says this part isn't exactly agreed on yet.)
> 

===============================
It is possible, we missed the making a distinction and adding a
diagnostic block, as in the following example.

TAP version 13
1..N
ok 1 Description # Directive
# Diagnostic
   ---
   message: 'Failure message'
   severity: fail
   data:
     got:
       - 1
       - 3
       - 2
     expect:
       - 1
       - 2
       - 3
   ...
ok 47 Description
ok 48 Description
=================================

We discussed the nesting TAB13 support a bit, but I don't think we
talked much about the diagnostic type messages that tests print that
end up between the header and the ok/notok lines.

Can you point me to the TAP parser you are using? I would like to
run a few tests and see if we can make it fully TAP13 compliant.

thanks,
-- Shuah
