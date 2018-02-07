From: daniel.diaz@linaro.org (=?UTF-8?Q?Daniel_D=C3=ADaz_Rodr=C3=ADguez?=)
Date: Wed, 7 Feb 2018 11:16:07 -0600
Subject: [Linux-kselftest-mirror] [PATCH] selftests/android: Fix line
	continuation in Makefile
In-Reply-To: <CAOuPNLh17DH2nZL86WSWKUKQJr-Z1EY+ZqRFsXRTqK-XMtyx2g@mail.gmail.com>
References: <1517961219-17700-1-git-send-email-daniel.diaz@linaro.org>
 <CAOuPNLh17DH2nZL86WSWKUKQJr-Z1EY+ZqRFsXRTqK-XMtyx2g@mail.gmail.com>
Message-ID:
 <CAEUSe79T9Miw==D6u3Wx-EMymzP8aABWf_Lfqb9KP57WZgU0ZQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180207171607.yCeTww9Oji5ddI_gd3NpkgpljsLIHnZ3HO8ExatRW1k@z>

Hello!


On 7 February 2018@00:01, Pintu Kumar <pintu.ping@gmail.com> wrote:
[...]
> Thanks for your patch.
> However, I have copied this Makefile from
> tools/testing/selftests/futex/Makefile before modifying it.
> If there is a problem with backslash then the same problem must be
> there in futex Makefile as well.

There is. Patch coming.


[...]
> Also is it because of make version ?
> Can you check your make version ?

It's make 3.81.

Thanks and greetings!

Daniel Díaz
daniel.diaz at linaro.org
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
