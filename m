From: guro at fb.com (Roman Gushchin)
Date: Sat, 19 Jan 2019 01:47:49 +0000
Subject: selftests/bpf/test_netcnt failed on i386 - ibbpf: failed to
 create map (name: 'percpu_netcnt'): Invalid argument
In-Reply-To: <CA+G9fYu-ku4dCOnUReot5jz3X18P1dWKiZCnnZaAJJt+p_HNjQ@mail.gmail.com>
References: <CA+G9fYu-ku4dCOnUReot5jz3X18P1dWKiZCnnZaAJJt+p_HNjQ@mail.gmail.com>
Message-ID: <20190119014742.GA15935@castle.DHCP.thefacebook.com>

On Fri, Jan 18, 2019 at 01:39:24PM +0530, Naresh Kamboju wrote:
> Newly added test case bpf test_netcnt failed on i386 and qemu_i386 on
> mainline and -next kernel.
> Here we are running i386 kernel on x86_64 device.
> Pass on x86_64, arm64 and arm.
> 
> Am i missing any pre required Kconfigs ?

Hi Naresh!

Thank you for the report, I'll take a look.

Based on the results you've linked, it looks like there are many
failed bpf tests, so I can assume there is one or more shared problems.

Thanks!
