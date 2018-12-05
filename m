From: shuah@kernel.org (shuah)
Date: Wed, 5 Dec 2018 16:21:30 -0700
Subject: [PATCH] selftests: gpio: Find libmount with pkg-config if
 available
In-Reply-To: <CADYN=9LEVUgz_ou6kWrXZGBpUZ5Ti7BB+0Uxp1NtP18BJDVHCg@mail.gmail.com>
References: <20181016214659.22362-1-daniel.diaz@linaro.org>
 <CACRpkda1i_NDnBGgrEoY2ewdSvSnJFVLWWvmSGCu0sNS0hLyiQ@mail.gmail.com>
 <CADYN=9LEVUgz_ou6kWrXZGBpUZ5Ti7BB+0Uxp1NtP18BJDVHCg@mail.gmail.com>
Message-ID: <6dc6f709-6940-4f63-c8d0-9cbbbd39ac2a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181205232130.AZzMm_kAHvmZY4w2K8fhPTiRXmTxnK0PH6-R81O_JhU@z>

On 12/5/18 4:15 PM, Anders Roxell wrote:
> On Wed, 5 Dec 2018@22:50, Linus Walleij <linus.walleij@linaro.org> wrote:
>>
>> Sorry for top-posting,
>>
>> I don't understand the selftest environment very well so I do not know
>> if this is the right thing to do.
>>
>> I can merge the patch through the GPIO tree but I need a nod from
>> someone wise, like Shuah Khan or Anders Roxell (Anders has been
>> using the GPIO selftests) that this is the direction we want to go.
> 
> Yes this makes sense and its already in linux-next.
> 

Linus,

Great. I pulled this in last week into kselftest next for 4.21-rc1 
thinking that this is a good direction.

thanks,
-- Shuah
