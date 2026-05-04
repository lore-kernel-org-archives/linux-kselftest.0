Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1E52D8DC3
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 19:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777923933; cv=none; b=qjEg7aDT3vITBsSM53PzTBvBs+oR3JsXs1Z/XJ7Z2jJ5ZwmU3yTPW/d6GS81g2JDsIqDfXho7rKDOnryuPHw1UzLZ/Gz17198rqEgYnRbnJExqQ86EgUXYPwHHFopFXtVG+94/M5aWMF8q5k07Rs54Obn1VHIfI9MqIc+CVmnPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777923933; c=relaxed/simple;
	bh=KQ+7KHXKleAsHDns41TC+7RjSnGN2oCzmjY3uhY0+ZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=II6zQopvf5CiVc2d4u4t1v4vzuwhUg1+YWORuXUW7eluqOeVA0OrpTnv9zlrSgYc0MwcxJmg/I+0ycBcw1ZiLLoOaMdB0LFJdviICmeQda4B0UzEp3Yv7TyDf1QIYs9o3LLs7sx2DBAEaCEuuuu0od+wlsSl5wCjQ9fKp6ujluA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IC0vt6EJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZoNRnuIm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IC0vt6EJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZoNRnuIm; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IC0vt6EJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZoNRnuIm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IC0vt6EJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZoNRnuIm"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3A8026B2D0;
	Mon,  4 May 2026 19:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777923930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N6503Bp9N1pbt6myxpERER1lLrpAG3W8C/49lI7OrVs=;
	b=IC0vt6EJTiirXmeC1zKoxy5VOLPuGKhdk29Yv1I/HzLbb1haJndB0cRT8y7+ylTTFroy21
	Cdu2/ezIbvsYAERZfpeFW1gwe05gLJ6vGKXWyPIQkwqeobaIZLcBVCc2kPmLrY8L81CEGe
	Xr+qSEEFi7xMFsOhYdskumRH3MiOGOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777923930;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N6503Bp9N1pbt6myxpERER1lLrpAG3W8C/49lI7OrVs=;
	b=ZoNRnuImMq7a89/e9jrAIPe+RdDdQr0GtQJmVszX2vXcMPjB3F8w13bmXdOI4lt52FUDOs
	pFgPkOQMp81ypEAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777923930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N6503Bp9N1pbt6myxpERER1lLrpAG3W8C/49lI7OrVs=;
	b=IC0vt6EJTiirXmeC1zKoxy5VOLPuGKhdk29Yv1I/HzLbb1haJndB0cRT8y7+ylTTFroy21
	Cdu2/ezIbvsYAERZfpeFW1gwe05gLJ6vGKXWyPIQkwqeobaIZLcBVCc2kPmLrY8L81CEGe
	Xr+qSEEFi7xMFsOhYdskumRH3MiOGOs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777923930;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N6503Bp9N1pbt6myxpERER1lLrpAG3W8C/49lI7OrVs=;
	b=ZoNRnuImMq7a89/e9jrAIPe+RdDdQr0GtQJmVszX2vXcMPjB3F8w13bmXdOI4lt52FUDOs
	pFgPkOQMp81ypEAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B6494593A3;
	Mon,  4 May 2026 19:45:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ax7AKVn3+Gk/FgAAD6G6ig
	(envelope-from <fmancera@suse.de>); Mon, 04 May 2026 19:45:29 +0000
Message-ID: <87ebe3d5-7dd1-4ee9-a870-1f4d1eb6574a@suse.de>
Date: Mon, 4 May 2026 21:45:19 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2 net] selftests: fib_tests: add temporary IPv6 address
 renewal test
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, dsahern@kernel.org
References: <20260503221139.3742-3-fmancera@suse.de>
 <20260503221139.3742-4-fmancera@suse.de> <20260504164149.GB385401@shredder>
Content-Language: en-US
From: Fernando Fernandez Mancera <fmancera@suse.de>
In-Reply-To: <20260504164149.GB385401@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On 5/4/26 6:41 PM, Ido Schimmel wrote:
> On Mon, May 04, 2026 at 12:11:41AM +0200, Fernando Fernandez Mancera wrote:
>> Add a test to check that temporary IPv6 address is regenerated properly
>> after the base prefix is deprecated and restored.
>>
>> Fib6 temporary address renewal test
>>      TEST: IPv6 temporary address cleanly deprecated and regenerated     [ OK ]
> 
> Thanks for the test, but I reverted the fix and it still passes :(
> 

Ugh sorry for that. I lowered the sleep time so it takes less time to 
run and I messed up the test. It seems 2 seconds isn't enough and to 
reliable reproduce it, 3 seconds are required.

I am reposting with the test fixed, sorry again for the noise.

>>
>> Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
>> ---
>>   tools/testing/selftests/net/fib_tests.sh | 55 +++++++++++++++++++++++-
>>   1 file changed, 54 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/net/fib_tests.sh b/tools/testing/selftests/net/fib_tests.sh
>> index af64f93bb2e1..6a6e545cb40d 100755
>> --- a/tools/testing/selftests/net/fib_tests.sh
>> +++ b/tools/testing/selftests/net/fib_tests.sh
>> @@ -12,7 +12,7 @@ TESTS="unregister down carrier nexthop suppress ipv6_notify ipv4_notify \
>>          ipv4_route_metrics ipv4_route_v6_gw rp_filter ipv4_del_addr \
>>          ipv6_del_addr ipv4_mangle ipv6_mangle ipv4_bcast_neigh fib6_gc_test \
>>          ipv4_mpath_list ipv6_mpath_list ipv4_mpath_balance ipv6_mpath_balance \
>> -       ipv4_mpath_balance_preferred fib6_ra_to_static"
>> +       ipv4_mpath_balance_preferred fib6_ra_to_static fib6_temp_addr_renewal"
>>   
>>   VERBOSE=0
>>   PAUSE_ON_FAIL=no
>> @@ -1611,6 +1611,58 @@ fib6_ra_to_static()
>>   	cleanup &> /dev/null
>>   }
>>   
>> +fib6_temp_addr_renewal() {
>> +	setup
>> +
>> +	echo
>> +	echo "Fib6 temporary address renewal test"
>> +	set -e
>> +
>> +	# ra6 is required for the test. (ipv6toolkit)
>> +	if [ ! -x "$(command -v ra6)" ]; then
>> +	    echo "SKIP: ra6 not found."
>> +	    set +e
>> +	    cleanup &> /dev/null
>> +	    return
>> +	fi
>> +
>> +	# Create a pair of veth devices to send a RA message from one
>> +	# device to another.
>> +	$IP link add veth1 type veth peer name veth2
>> +	$IP link set dev veth1 up
>> +	$IP link set dev veth2 up
>> +
>> +	# Make veth1 ready to receive RA messages.
>> +	$NS_EXEC sysctl -wq net.ipv6.conf.veth1.accept_ra=2
>> +	$NS_EXEC sysctl -wq net.ipv6.conf.veth1.use_tempaddr=2
>> +	$NS_EXEC sysctl -wq net.ipv6.conf.veth1.temp_prefered_lft=15
>> +	$NS_EXEC sysctl -wq net.ipv6.conf.veth1.max_desync_factor=0
>> +
>> +	# Send a RA message with a prefix from veth2.
>> +	$NS_EXEC ra6 -i veth2 -s fe80::1 -d ff02::1 -P 2001:12::/64\#LA\#3600\#3600 -e
>> +	sleep 2
>> +
>> +	# Deprecate it
>> +	$NS_EXEC ra6 -i veth2 -s fe80::1 -d ff02::1 -P 2001:12::/64\#LA\#3600\#0 -e
>> +	sleep 2
>> +
>> +	# Restore it
>> +	$NS_EXEC ra6 -i veth2 -s fe80::1 -d ff02::1 -P 2001:12::/64\#LA\#3600\#3600 -e
>> +
>> +	ret=1
>> +	for i in $(seq 1 25); do
>> +		sleep 1
>> +		num_dep="$($IP -6 addr | grep -c "temporary deprecated" || true)"
>> +		num_tot="$($IP -6 addr | grep -c "temporary" || true)"
>> +
>> +		if [ "$num_dep" -eq 1 ] && [ "$num_tot" -ge 2 ]; then
>> +			ret=0
>> +			break
>> +		fi
>> +	done
>> +	log_test "$ret" 0 "IPv6 temporary address cleanly deprecated and regenerated"
> 
> Missing:
> 
> set +e
> 
> cleanup &> /dev/null
> 
> Like in fib6_ra_to_static() and the skip path?

Oops, thanks!

> 
>> +}
>> +
>>   # add route for a prefix, flushing any existing routes first
>>   # expected to be the first step of a test
>>   add_route()
>> @@ -3002,6 +3054,7 @@ do
>>   	ipv6_mpath_balance)		ipv6_mpath_balance_test;;
>>   	ipv4_mpath_balance_preferred)	ipv4_mpath_balance_preferred_test;;
>>   	fib6_ra_to_static)		fib6_ra_to_static;;
>> +	fib6_temp_addr_renewal)		fib6_temp_addr_renewal;;
>>   
>>   	help) echo "Test names: $TESTS"; exit 0;;
>>   	esac
>> -- 
>> 2.53.0
>>
> 

