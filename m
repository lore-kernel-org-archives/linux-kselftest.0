From: pintu.ping@gmail.com (Pintu Kumar)
Date: Thu, 8 Feb 2018 10:45:14 +0530
Subject: [Linux-kselftest-mirror] [PATCH] selftests/android: Fix line
	continuation in Makefile
In-Reply-To: <CAEUSe79T9Miw==D6u3Wx-EMymzP8aABWf_Lfqb9KP57WZgU0ZQ@mail.gmail.com>
References: <1517961219-17700-1-git-send-email-daniel.diaz@linaro.org>
 <CAOuPNLh17DH2nZL86WSWKUKQJr-Z1EY+ZqRFsXRTqK-XMtyx2g@mail.gmail.com>
 <CAEUSe79T9Miw==D6u3Wx-EMymzP8aABWf_Lfqb9KP57WZgU0ZQ@mail.gmail.com>
Message-ID:
 <CAOuPNLhwSaG2K2X_xE4PzaXQFWzNLVN=F+dtqPg=iBduWzRxTg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180208051514.W5_OZMFGnQjWH6i197mGxKO1n3m9VzFa7Ux-U-j6-Wk@z>

On Wed, Feb 7, 2018 at 10:46 PM, Daniel Díaz Rodríguez
<daniel.diaz@linaro.org> wrote:
> Hello!
>
>
> On 7 February 2018@00:01, Pintu Kumar <pintu.ping@gmail.com> wrote:
> [...]
>> Thanks for your patch.
>> However, I have copied this Makefile from
>> tools/testing/selftests/futex/Makefile before modifying it.
>> If there is a problem with backslash then the same problem must be
>> there in futex Makefile as well.
>
> There is. Patch coming.

OK

>
>
> [...]
>> Also is it because of make version ?
>> Can you check your make version ?
>
> It's make 3.81.

My make version was 4.1.
So I did not face any problem. I guess this problem is fixed from make
version 4.x on wards.
However, for backward compatibility we can include these change.

So, its looks good for me, however someone else must approve it.


>
> Thanks and greetings!
>
> Daniel Díaz
> daniel.diaz at linaro.org
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
