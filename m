From: u9012063@gmail.com (William Tu)
Date: Thu, 14 Jun 2018 04:06:21 -0700
Subject: [PATCH] selftests: bpf: config: add config fragments
In-Reply-To: <d6851756-ae3b-09ec-f487-1eeece6bd4c6@iogearbox.net>
References: <20180612110510.11731-1-anders.roxell@linaro.org>
 <d6851756-ae3b-09ec-f487-1eeece6bd4c6@iogearbox.net>
Message-ID:
 <CALDO+SY3qNYAOSiYC3645C7YY9LSx7ggg0GjY76m4TbBfF_t3A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180614110621.1qaG5flSPbJfxG5eKFQuN9rawzibkdBuKGkZSHQ_69c@z>

On Tue, Jun 12, 2018@5:08 PM, Daniel Borkmann <daniel@iogearbox.net> wrote:
> On 06/12/2018 01:05 PM, Anders Roxell wrote:
>> Tests test_tunnel.sh fails due to config fragments ins't enabled.
>>
>> Fixes: 933a741e3b82 ("selftests/bpf: bpf tunnel test.")
>> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
>> ---
>>
>> All tests passes except ip6gretap that still fails. I'm unsure why.
>> Ideas?

Hi Anders,

ip6erspan is based on ip6gretap, does ip6erspan pass?

Regards,
William
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
