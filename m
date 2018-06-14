From: u9012063 at gmail.com (William Tu)
Date: Thu, 14 Jun 2018 05:08:50 -0700
Subject: [PATCH] selftests: bpf: config: add config fragments
In-Reply-To: <CADYN=9+3V4fpqbjh-X4VUVWd_X38XSYhEbZoRBffcx=-nMtF8g@mail.gmail.com>
References: <20180612110510.11731-1-anders.roxell@linaro.org>
 <d6851756-ae3b-09ec-f487-1eeece6bd4c6@iogearbox.net>
 <CALDO+SY3qNYAOSiYC3645C7YY9LSx7ggg0GjY76m4TbBfF_t3A@mail.gmail.com>
 <CADYN=9+3V4fpqbjh-X4VUVWd_X38XSYhEbZoRBffcx=-nMtF8g@mail.gmail.com>
Message-ID: <CALDO+SZXvnUU7VKd_UwnBCU0NiTHjqei4xEUCdcktkKCD3MnEg@mail.gmail.com>

On Thu, Jun 14, 2018 at 4:42 AM, Anders Roxell <anders.roxell at linaro.org> wrote:
> On 14 June 2018 at 13:06, William Tu <u9012063 at gmail.com> wrote:
>> On Tue, Jun 12, 2018 at 5:08 PM, Daniel Borkmann <daniel at iogearbox.net> wrote:
>>> On 06/12/2018 01:05 PM, Anders Roxell wrote:
>>>> Tests test_tunnel.sh fails due to config fragments ins't enabled.
>>>>
>>>> Fixes: 933a741e3b82 ("selftests/bpf: bpf tunnel test.")
>>>> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
>>>> ---
>>>>
>>>> All tests passes except ip6gretap that still fails. I'm unsure why.
>>>> Ideas?
>>
>> Hi Anders,
>>
>> ip6erspan is based on ip6gretap, does ip6erspan pass?
>
> it did pass  when I was sending the email.
> However, I retested this on next-20180613 and now it fails.
>
Does 'ip -s link show' show any errors/dropped on ip6gretap device?

Thanks
William
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
