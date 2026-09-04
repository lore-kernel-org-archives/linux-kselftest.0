Received: from mta0.migadu.com (out-156.mta0.migadu.com [91.218.175.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF741CD2C
	for <linux-kselftest@vger.kernel.org>; Fri,  4 Sep 2026 02:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788487808; cv=none; b=r2yTLMnENnNa2D+ogqDuhINYpqdOmre5vSX94Uxi5z158QDKa9M0Nx4dYPGMfkRtqkj1mYVvCCcMR3HDV+AhYAUwPibdRh7WvatzVhvJ+m3c8qfthJm++YNpuJXJWeB7nuLaADgPyj8Rd4SEpZeC/2Xnrm141zOGHlTrCB6/YfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788487808; c=relaxed/simple;
	bh=BMeFQ+GZlF4ab0g6//RFRMFJgtNUmqnK7e+RQqoIuyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RF1B9UkZdTkly1HPc5Rg7fT4SC8bO8Ny3PDzOJwp7rGW1hyAblAmleLVFxHJyzihAUXaIphcixdMVuiMWvrZBcoLlY2Y+plRdOmufBVR4rOhApEKRndgPKFssbU8q4ZSudTv4UpC5/9/X4uyrluHYT/g8dg2VAwcmsAfc/mqqAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kKypBwOM; arc=none smtp.client-ip=91.218.175.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kKypBwOM"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BMeFQ+GZlF4ab0g6//RFRMFJgtNUmqnK7e+RQqoIuyc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788487805; v=1; x=1789092605;
 b=kKypBwOMMHPfxwc+3gKGVnjDhc0wwlngjdDhMSry8Wc8guESX0xArFdnFOXV1RQ40Wbhoq0i
 Ja4BrCZr9w4+pmWUd3CMmC3nIdVAFxvOpF89714UxveDQlZVaEzumZu91FcNZABItiGCKI2BWCZ
 kcF9dmFDXI8E4AGTBSOzsRcU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f1d90e771c373216;
	Fri, 04 Sep 2026 02:09:55 +0000
X-Mizu-Trace-ID: f1d90e771c373216
X-Migadu-Flow: FLOW_OUT
Message-ID: <56484f61-7290-4e3a-bb02-66c53042b180@linux.dev>
Date: Fri, 4 Sep 2026 10:09:30 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v1 0/2] netdevsim: add TLS device offload
 emulation and test
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260901154914.11637-1-jiayuan.chen@linux.dev>
 <20260903155932.6b4528de@kernel.org>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20260903155932.6b4528de@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


on 9/4/26 6:59 AM, Jakub Kicinski wrote:
> On Tue,  1 Sep 2026 23:48:55 +0800 Jiayuan Chen wrote:
>> It helped me find
>> commit b17cf742eaad ("tls: device: fix out-of-bounds write in tls_append_frag()").
>>
>> So I think it is worth sending a formal patchset.
>>
>> The kTLS device offload path in net/tls/tls_device.c has no test
>> coverage upstream -- selftests/net/tls.c is software only, and the
>> offload code needs a driver that implements it.
>>
>> So teach netdevsim to fake it.  Patch 1 implements tlsdev_ops and
>> advertises the TLS features, patch 2 adds a selftest.
>>
>> No crypto is done: TX puts the plaintext record on the wire, RX just
>> sets skb->decrypted.  That only works netdevsim to netdevsim, but it
>> covers record assembly and the offload lifecycle.  Real ciphertext, and
>> more on top of it, can come later.
> Please don't post selftests to net-next which depend on a fix going
> to another tree. If we merge this now we will have a failing test
> until the fix also lands.
>
> If we add TLS support to netdevsim it must be paired with a test
> which can also run against real HW. There was a selftest posted
> recently by the person working on TLS 1.3 offload, we can use that
> as the target (feel free to add that to your series, just keep
> the original author).
>
> We can add special netdevsim-only cases but the main focus should
> be writing tests that can be executed against real devices.


I think I just wait until that series is merged and then take a next setp.

