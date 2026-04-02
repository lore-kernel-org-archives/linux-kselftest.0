Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA50038D016
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 09:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775123333; cv=none; b=VH67ejrplqs4lxDpHP0KNvrMBnBBH6gTbMEuUAIK98SJtVcEnaElEcnuFXGHiPfUZEQmX2nqIF3Fa4eK0IzWt+XtYovzDzuHJxUyKb7hTmwPPq+o35PSrGj8FNlGyHHNd/scovBgR+ZZF7aMBuaktLoznYdYKD0FDao1yM//lYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775123333; c=relaxed/simple;
	bh=FxR2bhBkRY0ikaJ1Hs1fd9nHf+FN0AGKBDKZwHlC+gg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OC+4FPKGO682Cz6Je9mtg+SNoOms0VHjWTS7LCixEQduNnrsbbTd9RMFEckwsA/EL2ZI59eTL93MPf/mvGuXNPS/YrFwmjRVZmGP7BGF/Afvj5N/Cd33RzdrTQ0qa13iVX6LxRu2u/cLECNlbYqfBykJdCE2C+LJv2Ukkfo5fx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KCWceTh6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z+kV8++Z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KCWceTh6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z+kV8++Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775123325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tLN44LxxXgYTiWrwLkxzAK8Zoqz3iKp5J7224wtn/u4=;
	b=KCWceTh6w59zPJbCslbmZrqWhnq2N5ye4Y4ty+BtL//6TQ2LRR8f0NQ2AfyuFCcJ2QRksF
	klh0RRVGkvNc/kbJseMAHyMeZO747MZlxvLPuFYp2BKZ1mtPNjyRxdg2BPeR5XdOdM7Wn+
	7aif9natp7gO7pdCDw33G5d84bTIbtc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-ApUl3UADNOiYUTEfmcOVpg-1; Thu, 02 Apr 2026 05:48:43 -0400
X-MC-Unique: ApUl3UADNOiYUTEfmcOVpg-1
X-Mimecast-MFC-AGG-ID: ApUl3UADNOiYUTEfmcOVpg_1775123322
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4837bfcfe0dso10709865e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 02:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775123322; x=1775728122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tLN44LxxXgYTiWrwLkxzAK8Zoqz3iKp5J7224wtn/u4=;
        b=Z+kV8++ZG8I0b/VTs68aucsnVGe8e4N2ThrqekVy5f+PN469KC2Vpm51FR6lSWKBsN
         SvJrwCZd78z0vE5/PknU7G9YVW2qV60KqxLkhVkZ8CruVwX1QeFvy5vbBvhTZAohVbsP
         4jTYGTUHM8T9Nu5hIbn33hsmDmPa2uMwtqCZWwZyuyKTLsD9QM4wV5NUqfYtBG0sWV5W
         U5cNbV0B0FQ5fM1QuBboCQaaelwbqr8CqBCMY+jNmsCt5tS4uQ19EXBbhXtH8qWAgq7k
         gjt0LNNMWDHRIN/UiPtwU1GiE9aYN/4k+Bqfa8QI3yfJJBnVlpN/DUSZcWUJOwZt0kvY
         XllA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775123322; x=1775728122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tLN44LxxXgYTiWrwLkxzAK8Zoqz3iKp5J7224wtn/u4=;
        b=ZYSdgawUEvExzoD1gp35CtdXm//zxu8FYtL6Bz2TKfvi5cjdTrOgT9QPpdlYBDeuSs
         z+pXfE5/k11YG4YmuE61ARZpFvnKerN+wXtaTDr1VwuZjkCIK5SHIW4Ajx5Ymv7kdEBn
         AgKm9lxHSmYN72NNrCaB+vS0FIMXXCYaX0za8aRT8u2qkR+wC2MT24XQXEXs5CnZ5Ao9
         0oxvGdul4H6/aJ4OcDVV4/3HXtB4MxIYcnixxfOjSfmbxhIBMAgG4hysz6U7hLDMi6m9
         cHCWrLtyFoVluh2pQGg3xQ4OH1C8wUIlb7yIG4oiUw85b7jmuXyVn7LO1Y69PevU3npr
         z/9w==
X-Forwarded-Encrypted: i=1; AJvYcCWsyQlOBdSebAXXkP7dNIPGlb5omRZeJJ36ulLpco9x0hsdyr5ExfirA3ljbl0XiBw6B0Z5TkIq954Kks4/iK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH3Rlk9Cu40oxFKJEVDWHaNMjyjvxYyheOj1y4TAA0N+B1Jms5
	xIHl3BsNKCiaVxVlB+EiyszvEa34X/eIIHGdinJ0V5pd3mi/6eemxEz9OZK8zdUoIDvihLW4QZL
	j+hItUS5YX+PjsDYZ6DFo6XNA8U9kMtLZVBlova0j0S4qlx6V+b7YWZtcGxdFKur1MseNjQ==
X-Gm-Gg: ATEYQzyLab1rw/3vhRbWVBBFNxfPQmSd3/0VLGw35Y1CS9gD66Uh5sKuwVDmluNww5I
	HQy8bHepamYIKAwUmjQ6Yl7P9D2dFY+fC26O3YDrxEgBO0+lp3eY6E/LxfsbzJh5S2FJwqht2OM
	/asBWe4uT+i3v0xj3i689TBufqdBTk9Hoh2WzVs1YIKKczyNiq7I8Mk6t+azxUARofvwkECUfI8
	HncRs42kLTbqJ8tHVuQedEMkVw3/7ZekhSn0hqPcAuXvtAFAch5sDUNLikeg/MSGeyds50Ntk1R
	1z3NeiiptHFJNpbG0i78H3MQoG13ta2Dx/4z2w2SLHHy7+HgI6QCPIPBkqjBE5jk1Z63hzwrcgl
	EWwjLMtavdPAeGd9qVbS/8COUSBtsqHQbS9jRpRkZ5eLcoTzOg7CCY9fFtg==
X-Received: by 2002:a05:600c:45c5:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-48883592213mr114334295e9.23.1775123322354;
        Thu, 02 Apr 2026 02:48:42 -0700 (PDT)
X-Received: by 2002:a05:600c:45c5:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-48883592213mr114333895e9.23.1775123321886;
        Thu, 02 Apr 2026 02:48:41 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8852a5sm148784745e9.9.2026.04.02.02.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 02:48:41 -0700 (PDT)
Message-ID: <50ae3c69-2c4e-499f-a46a-cbd207ff5f09@redhat.com>
Date: Thu, 2 Apr 2026 11:48:39 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7] selftests: net: add tests for PPP
To: Qingfang Deng <dqfext@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Dianne Skoll <dianne@skoll.ca>
Cc: Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 Felix Maurer <fmaurer@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>
References: <20260330035604.133073-1-dqfext@gmail.com>
 <20260401081030.29b050d5@kernel.org>
 <CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com>
 <20260401175621.549c492e@kernel.org>
 <CALW65jaTbaosbO8ypKZ6G37HxuxXabeTaP_Fhq72xTovmDj+8g@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CALW65jaTbaosbO8ypKZ6G37HxuxXabeTaP_Fhq72xTovmDj+8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/2/26 4:26 AM, Qingfang Deng wrote:
> On Thu, Apr 2, 2026 at 8:56 AM Jakub Kicinski <kuba@kernel.org> wrote:
>> On Wed, 1 Apr 2026 23:45:38 +0800 Qingfang Deng wrote:
>>>> # iperf3: error - unable to connect to server - server may have stopped running or use a different port, firewall issue, etc.: Network is unreachable
>>>> # TEST: PPPoE                                                         [FAIL]
>>>> not ok 1 selftests: net/ppp: pppoe.sh # exit=1
>>>
>>> It looks like pppoe-server fails to start. You may check the syslog to
>>> see what's going on.
>>
>> Hm, we don't capture syslog automatically :S We capture stdout and
>> stderr
>>
>> I'm not even sure there's something listening on syslog in virtme-ng
>> Is it possible to make the daemon log to stdout or a file and dump
>> that file to stdout on failure? Even if we fix the current issue
>> it will be quite inconvenient if we have to go into syslog every time
>> the test is failing. The test output should provide enough info to
>> debug failures.
> 
> Add Cc: Dianne
> 
> I checked the man page of pppoe-server and did not find such option.
> We can instead start our own listener and redirect the syslog to a
> file or stdout:
> 
> socat -u UNIX-RECV:/dev/log,ignoreeof STDOUT &

Note that similar failures in the past in other test-cases were usually
due to timing issues. i.e. the pppoe-server starts in background too
late for the client.

Possibly a somewhat clean solution is to wait in a loop for the
'pppoe-server ready' event, somewhat similar to wait_local_port_listen().

Otherwise an hackish sleep in between should do.

Note that you should be possibly able to reproduce this kind of failure
in a virtualized/slow enough environment (i.e. using vng as described on
nipa wiki)

Finally, note that in this test script you should start the socat
listener only if /dev/log does not exists, or ignore socat startup
errors - because self-test should run also on different systems.

/P


