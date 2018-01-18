From: jiri at resnulli.us (Jiri Pirko)
Date: Thu, 18 Jan 2018 08:51:36 +0100
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 02/12] selftests:
 forwarding: Add a test for FDB learning
In-Reply-To: <20180118071654.GA5379@splinter>
References: <20180115191853.26129-1-idosch@mellanox.com>
 <20180115191853.26129-3-idosch@mellanox.com>
 <33d3f4a4-8b92-60da-3e1f-327effb7eda0@gmail.com>
 <20180117210137.GJ2114@nanopsycho>
 <CAJieiUh_jgxof2J3vqeyXUbQpNtha+1qtfo2Y9JTq3rz0+XXuw@mail.gmail.com>
 <CAJieiUiB14Js0hTk7E_4+AmyAZbjHTCE_MWpU-=7FbMsjvHB2w@mail.gmail.com>
 <20180117233124.GA26967@nanopsycho>
 <9e1bfed9-34a3-5810-230e-0bef75a43fb9@gmail.com>
 <20180118071654.GA5379@splinter>
Message-ID: <20180118075136.GA2290@nanopsycho>

Thu, Jan 18, 2018 at 08:16:54AM CET, idosch at idosch.org wrote:
>On Wed, Jan 17, 2018 at 04:15:04PM -0800, David Ahern wrote:
>> How about the attached - make ping, ping6 and mz variables? Default to
>> ping and mausezahn but let users update that name if necessary. Comments
>> in the sample config to the effect need to be added to help users.
>
>Yes, looks good to me. Will include the change in the next version.

Ido, please keep in mind that the script should run without the config
file. So the defaults should be in lib.sh.

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
