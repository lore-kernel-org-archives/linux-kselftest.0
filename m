From: jiri at resnulli.us (Jiri Pirko)
Date: Wed, 17 Jan 2018 22:01:37 +0100
Subject: [Linux-kselftest-mirror] [RFC PATCH net-next 02/12] selftests:
 forwarding: Add a test for FDB learning
In-Reply-To: <33d3f4a4-8b92-60da-3e1f-327effb7eda0@gmail.com>
References: <20180115191853.26129-1-idosch@mellanox.com>
 <20180115191853.26129-3-idosch@mellanox.com>
 <33d3f4a4-8b92-60da-3e1f-327effb7eda0@gmail.com>
Message-ID: <20180117210137.GJ2114@nanopsycho>

Wed, Jan 17, 2018 at 09:48:54PM CET, dsahern at gmail.com wrote:
>On 1/15/18 11:18 AM, Ido Schimmel wrote:
>> diff --git a/tools/testing/selftests/forwarding/lib.sh b/tools/testing/selftests/forwarding/lib.sh
>> index bb423371f4de..264bf0af4c4d 100644
>> --- a/tools/testing/selftests/forwarding/lib.sh
>> +++ b/tools/testing/selftests/forwarding/lib.sh
>> @@ -22,6 +22,11 @@ if [[ ! -x "$(command -v jq)" ]]; then
>>  	exit 0
>>  fi
>>  
>> +if [[ ! -x "$(command -v mausezahn)" ]]; then
>> +	echo "SKIP: mausezahn not installed"
>> +	exit 0
>> +fi
>> +
>
>The checks are good, but hitting a collision with this one:
>$   ./router.sh
>SKIP: mausezahn not installed
>
>For debian, it is mz not mausezahn.

That is weird. If you look at the sources, the binary name is
"mausezahn". Looks like debian is doing some renaming :/

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
