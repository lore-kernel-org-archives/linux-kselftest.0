From: daniel.diaz@linaro.org (=?UTF-8?Q?Daniel_D=c3=adaz?=)
Date: Wed, 21 Feb 2018 16:45:17 -0600
Subject: [PATCH 1/2] selftests: gpio: restructure Makefile
In-Reply-To: <CAHp75VdceMCPw1b8NNoNLTqU-7b7gZ6b8i6eS1MF8eUTH7Lcjg@mail.gmail.com>
References: <1519249964-1630-1-git-send-email-daniel.diaz@linaro.org>
 <CAHp75VdceMCPw1b8NNoNLTqU-7b7gZ6b8i6eS1MF8eUTH7Lcjg@mail.gmail.com>
Message-ID: <290910ca-2e0f-8550-0f9c-e48cf277a27c@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180221224517.Ig6pOsnYLmVochAo5DOs5mE_7Pacnre6cCg9uvDXPhc@z>

Hello!


On 02/21/2018 04:06 PM, Andy Shevchenko wrote:
> On Wed, Feb 21, 2018@11:52 PM, Daniel Díaz <daniel.diaz@linaro.org> wrote:
>> From: Fathi Boudra <fathi.boudra at linaro.org>
> 
> What are you doing here?
> Why?
> What is the benefit of it?

Thanks for looking into this. I will resend with description.

The purpose of the patch is to clean up the Makefile by restructuring
explicit paths in targets for variables, substituting a variable
(BINARIES) for one of the build system (TEST_PROGS_EXTENDED), and proper
cleaning up of the EXTRA objects.

The resulting Makefile is much more readable and manageable.

Greetings!

Daniel Díaz
daniel.diaz at linaro.org
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
