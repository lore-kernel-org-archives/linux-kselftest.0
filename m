From: daniel@iogearbox.net (Daniel Borkmann)
Date: Wed, 31 Oct 2018 23:11:23 +0100
Subject: [PATCH v2] kselftests/bpf: use ping6 as the default ipv6 ping
 binary if it exists
In-Reply-To: <CAPhsuW4Bm2H7sV8xgzcD9s=9d_z1bpeEYbo2OMTTh9mcgmrC0w@mail.gmail.com>
References: <1540869355-13324-1-git-send-email-lizhijian@cn.fujitsu.com>
 <CAPhsuW4Bm2H7sV8xgzcD9s=9d_z1bpeEYbo2OMTTh9mcgmrC0w@mail.gmail.com>
Message-ID: <9244917c-05d7-113d-fef8-ff5251c8e0fe@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181031221123.Ei7KaH2Kgw8ixYgr4hg2iW2NK9nic0X411M1LAopBO4@z>

On 10/30/2018 07:35 PM, Song Liu wrote:
> On Mon, Oct 29, 2018@7:35 PM Li Zhijian <lizhijian@cn.fujitsu.com> wrote:
>>
>> ping binary on some distros doesn't support "ping -6" anymore.
>>
>> Signed-off-by: Li Zhijian <lizhijian at cn.fujitsu.com>
> 
> I think this should go bpf-next. Please resubmit when the bpf-next tree is open
> (after the merge window). Other than this:
> 
> Acked-by: Song Liu <songliubraving at fb.com>

Ok, applied to bpf tree, thanks. Given the fix, though not too urgent perhaps,
is small and isolated enough, I've applied it there.
