Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59B8456E19;
	Fri, 11 Sep 2026 20:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789156877; cv=none; b=rop0j2LC/N+Ywb9fpx+NlbKd3JQXmtM+kpPrHwaEKjksgkkY2NHBnDe7bXqW/pjDtNHlEYx6fdLFAi4gR73QPCtxmvsgggZyvtfqJ86xokZETXBYDCaybguUqt+IByZkf5pOTTwj2s5Gi6jVlbeqySNZAB/h1lU9hqzhHRo4/c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789156877; c=relaxed/simple;
	bh=OUHE6zhTbrOhqldHpcFJbKy0ORJ0zTSZoOleg3b3QLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uayv4tSBpaGDEeham+V+JQ5qrTRsDbHdjpn2ICDasZOMf/cMT6w04V9RZg0sbLB6vd/HohOGjwem0hLIz7eGkOT89hZFGZEc1uQT72GaiTPkT8rKv4hbNLMXCsAmeqbhGRbpDPTxvVEVq7jkVx4+sko8uT7+IaMpwtLSKZffjSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S7dpufa2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S7dpufa2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3B21F00898;
	Fri, 11 Sep 2026 20:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789156863;
	bh=BZgzmuECJHadzIjRSWdkbG8kEUoKuAgu8NWPQ9kfPIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=S7dpufa2xYg/PpNyIs1/FKXc7lLDgoTokG4sLnUrwTSwVuSI7BbQ9nao81dva4KNn
	 xH8z9Y6lvbMpJokh62a/tDvtlaEh/x2+84iBtFDx1I55wl/T4ZLdeTKfnc5JighDfw
	 leFlQLxIeY2lXXGshZlto7MzOIcsXIkjxPqJTJ0HIhE1O9faULC4LAfNJzE/CjQ3zX
	 wizdG+PhOeCrJdXBIqX67uT4Or0dJtwFcSac0HX7R308X/hRA7VnTvIPL3JrCeo/xr
	 2rWLh/hg9Y9IiwxmP0jN+hJ4Zx4SQ4JR1Hel91xr8HRGrrPgB1WodmnYRclUdRkDpE
	 y5fUJXY7LWJmQ==
Message-ID: <15910291-2cef-4f25-8daf-4db73aa7a7d9@kernel.org>
Date: Fri, 11 Sep 2026 22:00:56 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH net 2/2] selftests: drv-net: psp: test PSP and TCP ULP
 mutual exclusion
Content-Language: fr
To: Daniel Zahka <daniel.zahka@gmail.com>, Eric Dumazet
 <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>,
 Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260910-psp-ktls-fix-v1-0-e3f30aaeca4e@gmail.com>
 <20260910-psp-ktls-fix-v1-2-e3f30aaeca4e@gmail.com>
 <DLCFLUP26J73.FNVCZ4ALAUHC@gmail.com>
From: Matthieu Baerts <matttbe@kernel.org>
Autocrypt: addr=matttbe@kernel.org; keydata=
 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
 lzVbFe7fduHbABmYz9cefQpO7wDE/Q==
Organization: NGI0 Core
In-Reply-To: <DLCFLUP26J73.FNVCZ4ALAUHC@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 11/09/2026 12:57, Daniel Zahka wrote:
> On Thu Sep 10, 2026 at 7:46 PM EDT, Daniel Zahka wrote:
>> Test both setting PSP after TLS ULP, and TLS ULP after PSP.
>>
>> Add CONFIG_TLS=y to the drivers/net/config.
>>
>> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
>> ---
>>  tools/testing/selftests/drivers/net/config |  1 +
>>  tools/testing/selftests/drivers/net/psp.py | 46 ++++++++++++++++++++++++++++++
>>  2 files changed, 47 insertions(+)
>>
>> diff --git a/tools/testing/selftests/drivers/net/config b/tools/testing/selftests/drivers/net/config
>> index b6989c7d3d9d..4838adf27fa1 100644
>> --- a/tools/testing/selftests/drivers/net/config
>> +++ b/tools/testing/selftests/drivers/net/config
>> @@ -21,5 +21,6 @@ CONFIG_NET_SCH_INGRESS=y
>>  CONFIG_NET_SCH_PRIO=m
>>  CONFIG_PPP=y
>>  CONFIG_PPPOE=y
>> +CONFIG_TLS=y
>>  CONFIG_VLAN_8021Q=m
>>  CONFIG_XDP_SOCKETS=y
>> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
>> index 315648a770d0..12b27f2a3fa1 100755
>> --- a/tools/testing/selftests/drivers/net/psp.py
>> +++ b/tools/testing/selftests/drivers/net/psp.py
>> @@ -23,6 +23,8 @@ from lib.py import NetNSEnter
>>  from lib.py import bkg, rand_port, wait_port_listen
>>  from lib.py import ip
>>  
>> +TCP_ULP = 31
>> +
>>  
>>  def _get_outq(s):
>>      one = b'\0' * 4
>> @@ -333,6 +335,50 @@ def assoc_version_mismatch(cfg):
>>              ksft_eq(the_exception.nl_msg.error, -errno.EINVAL)
>>  
>>  
>> +def _require_tls_ulp():
>> +    with socket.create_server(("localhost", 0)) as srv:
>> +        with socket.create_connection(srv.getsockname()) as s:
> 
> ruff is complaining about the nested 'with' statements. I ran ruff
> locally via nipa, but did not get the same result. It seems nipa doesn't
> use a ruff config file, and the discrepancy is because I have a
> different ruff version. I was able to reproduce by upgrading the
> version.

FYI, the CI is using the 'ruff' package from the Fedora repo. If it
helps, you can use the NIPA "build" container to have the same environment:

https://github.com/linux-netdev/nipa/wiki/Running-Netdev-CI-tests-locally#static-tests

Cheers,
Matt
