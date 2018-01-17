From: jiri at resnulli.us (Jiri Pirko)
Date: Thu, 18 Jan 2018 00:31:24 +0100
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 02/12] selftests:
 forwarding: Add a test for FDB learning
In-Reply-To: <CAJieiUiB14Js0hTk7E_4+AmyAZbjHTCE_MWpU-=7FbMsjvHB2w@mail.gmail.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
 <20180115191853.26129-3-idosch@mellanox.com>
 <33d3f4a4-8b92-60da-3e1f-327effb7eda0@gmail.com>
 <20180117210137.GJ2114@nanopsycho>
 <CAJieiUh_jgxof2J3vqeyXUbQpNtha+1qtfo2Y9JTq3rz0+XXuw@mail.gmail.com>
 <CAJieiUiB14Js0hTk7E_4+AmyAZbjHTCE_MWpU-=7FbMsjvHB2w@mail.gmail.com>
Message-ID: <20180117233124.GA26967@nanopsycho>

Wed, Jan 17, 2018 at 11:59:10PM CET, roopa at cumulusnetworks.com wrote:
>On Wed, Jan 17, 2018 at 2:46 PM, Roopa Prabhu <roopa at cumulusnetworks.com> wrote:
>> On Wed, Jan 17, 2018 at 1:01 PM, Jiri Pirko <jiri at resnulli.us> wrote:
>>> Wed, Jan 17, 2018 at 09:48:54PM CET, dsahern at gmail.com wrote:
>>>>On 1/15/18 11:18 AM, Ido Schimmel wrote:
>>>>> diff --git a/tools/testing/selftests/forwarding/lib.sh b/tools/testing/selftests/forwarding/lib.sh
>>>>> index bb423371f4de..264bf0af4c4d 100644
>>>>> --- a/tools/testing/selftests/forwarding/lib.sh
>>>>> +++ b/tools/testing/selftests/forwarding/lib.sh
>>>>> @@ -22,6 +22,11 @@ if [[ ! -x "$(command -v jq)" ]]; then
>>>>>      exit 0
>>>>>  fi
>>>>>
>>>>> +if [[ ! -x "$(command -v mausezahn)" ]]; then
>>>>> +    echo "SKIP: mausezahn not installed"
>>>>> +    exit 0
>>>>> +fi
>>>>> +
>>>>
>>>>The checks are good, but hitting a collision with this one:
>>>>$   ./router.sh
>>>>SKIP: mausezahn not installed
>>>>
>>>>For debian, it is mz not mausezahn.
>>>
>>> That is weird. If you look at the sources, the binary name is
>>> "mausezahn". Looks like debian is doing some renaming :/
>>>
>>
>> I have seen/used both versions. Debian packages from some old upstream
>> source which calls it mz.
>> https://packages.debian.org/sid/main/mz
>>
>> I have used latest mz (with ipv6 support etc) from netsniff-ng which
>> builds it as mausezahn.
>
>
>actually Debian also builds
>https://packages.debian.org/sid/netsniff-ng and installs 'mausezahn'
>
>so you might have to check and use which exists... (mausezahn overriding mz).

I believe we can stick with mausezahn, since it is apparently
available on Debian too.

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
