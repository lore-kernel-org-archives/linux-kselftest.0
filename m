From: u9012063@gmail.com (William Tu)
Date: Thu, 14 Jun 2018 04:15:32 -0700
Subject: mainline: x86_64: kernel panic: RIP:
 0010:__xfrm_policy_check+0xcb/0x690
In-Reply-To: <CADYN=9LztFGUOb-RaEByN-G-E1MpnEv_HtZtObhyZUWWt0nffg@mail.gmail.com>
References: <CA+G9fYuuiYES7ucAhgf8P-YXJPaYY2pi6kRKf6eBrfHvXJbQiw@mail.gmail.com>
 <20180612083435.7f7k4exergraaa2u@gauss3.secunet.de>
 <CADYN=9LztFGUOb-RaEByN-G-E1MpnEv_HtZtObhyZUWWt0nffg@mail.gmail.com>
Message-ID:
 <CALDO+SY6BGctJtZamvATrXDpy7zFCCGid5kqsZRQ7mtFUdxZ-Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180614111532.uNIamuwyjyC_REYYZqBvs4ndWAQWVha0sFzgrKh3GvM@z>

On Tue, Jun 12, 2018@5:09 AM, Anders Roxell <anders.roxell@linaro.org> wrote:
> On 12 June 2018@10:34, Steffen Klassert <steffen.klassert@secunet.com> wrote:
>> On Mon, Jun 11, 2018@10:11:46PM +0530, Naresh Kamboju wrote:
>>> Kernel panic on x86_64 machine running mainline 4.17.0 kernel while testing
>>> selftests bpf test_tunnel.sh test caused this kernel panic.
>>> I have noticed this kernel panic start happening from
>>> 4.17.0-rc7-next-20180529 and still happening on 4.17.0-next-20180608.
>>>
>>> [  213.638287] BUG: unable to handle kernel NULL pointer dereference
>>> at 0000000000000008
>>> ++[ ip xfrm poli  213.674036] PGD 0 P4D 0
>>> [  213.674118] audit: type=1327 audit(1528917683.623:7):
>>> proctitle=6970007866726D00706F6C69637900616464007372630031302E312E312E3130302F3332006473740031302E312E312E3230302F33320064697200696E00746D706C00737263003137322E31362E312E31303000647374003137322E31362E312E3230300070726F746F006573700072657169640031006D6F64650074756E6E
>>> [  213.677950] Oops: 0000 [#1] SMP PTI
>>> cy[ add src 10.1.  213.677952] CPU: 2 PID: 0 Comm: swapper/2 Tainted:
>>> G        W         4.17.0-next-20180608 #1
>>> [  213.677953] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
>>> 2.0b 07/27/2017
>>> [  213.726998] RIP: 0010:__xfrm_policy_check+0xcb/0x690
>>> [  213.731962] Code: 80 3d 0a d8 f1 00 00 0f 84 c1 02 00 00 4c 8b 25
>>> 2b af f4 00 e8 66 a6 6a ff 85 c0 74 0d 80 3d eb d7 f1 00 00 0f 84 d5
>>> 02 00 00 <49> 8b 44 24 08 48 85 c0 74 0c 48 8d b5 78 ff ff ff 4c 89 ff
>>> ff d0
>>
>> This looks like a bug that I've seen already. If it is what I think,
>> then commit 2c205dd3981f ("netfilter: add struct nf_nat_hook and use
>> it") introduced this bug.
>>
>> There was already a fix for this on the netdev list, but
>> I don't know the current status of that patch:
>>
>> https://patchwork.ozlabs.org/patch/921387/
>
> Hi, I applied the patch and ran bpf/test_tunnel.sh and I I couldn't
> see any crash.
> However, the script never returned (I had to Ctrl+c to get back), any ideas ?
> See log from the test below.
>
> Cheers,
> Anders
>
> [0;92mPASS: xfrm tunnel[0m

Hi Anders,
I think it should return 0 if you reach the above line.
The console output looks pretty messy due to using 'tee'
I will send a patch to make the output more readable.

Thanks
William
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
