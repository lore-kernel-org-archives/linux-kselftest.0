Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637152;
	b=BaGphVJRZ/EFWRBSE/QUZOtjrrdUqVAa5nlbRf6PREq+/v+RkR58WdXqVI+ntWpqCZns
	 nQW7Q2IHJOfjEqgTqMRurZ3pgtJVPkxjRY76medk6/gejv8YOpk1EDjTZJYzgaiGK2rfw
	 LzaC4Vreu1fLf5FZ0BWUcv0W4j4mlWZxNXFHOmXb96pWb3RuVNfPgdKAOSN1pHvheRH/r
	 MccK9tO+w/S9Tnnp0UpedFxOExoptgnvIWbWPQgSsnXUyqLinNhDr+qdmPIJQV/NAp7LD
	 VO0MhAVvoMKQt1uxEFHo+2GxHeNDL4m0LqUkc06zrUEXWw78xunjCam5EuS+VUVXC8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wb4mBzyfZ0kKUChcn64LcBZNg4proTG3oaURoFMVm9o=;
	b=Wbcvsdj7icqCaJr1iiHS3Amy9uSnOmNp466nLI4X0a/v7JB53/aU60KhcmINWAfdWWyS
	 3K6zRkcchSCusAD+5/q2BikI/YQeD4rQQ4v5V9PW0VSwrAletOJ/AGUE2TPuoHYfTLEK8
	 LdqdQI7NV0nlk7TDcBmlO5fFRd/uS5gGMMz3iHmZ2v4dZ9DfnVUoQtgesDixPmuWdKp3+
	 REwOZC+dJBydsGCf9Hg6UCK/yTOXsHVS2D2ydhYJZpON8EeDjibu3SaMPXBQUV6KbUN/L
	 K5HQitrVoFzDgZV/CBSqikwfG5gN5su+ASIJfSPkse0g/ebZUPMg66tySFGNHCEQa0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=K7dM6d50;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25C26072EFD
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 16:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F25C26072EFD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=K7dM6d50
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-83bbcfba0ffso2437796a34.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 08:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793637150; x=1794241950; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wb4mBzyfZ0kKUChcn64LcBZNg4proTG3oaURoFMVm9o=;
        b=K7dM6d50zwoz7aBhfl+TN8bK1XqD7HIB6KXzJnB6Ev2K7k6UMTITkbg/ivKc+8K2at
         TSljeWav5xZoG4upTbnADlaxFwv3+NlnzDGoelfQvT2EyAjf34EMwTBQhp5rFgxcGHz8
         bE2G0wwNppAlW6XH8B4OtcffWhAaq4xQphf5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793637150; x=1794241950;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wb4mBzyfZ0kKUChcn64LcBZNg4proTG3oaURoFMVm9o=;
        b=oNGWkMEVZbMJP/LQCGdZDMgDTPnkEtZN6fU+aGKsEvaTLS8Gg8I6DtvI33z7bQldUZ
         AGPjy92rvnbxDdm3qxPlApo7oS3vvpbvcc6xqFVyWuCDbOyj5+mR1pPHum/THwmG/Ija
         5Xy067sXbWxzeL7+Co1w8R0mdsuaE5Zo+eoSo+xM1hgHbRZG/GSvO59IEa2BzIMyDAER
         mJpFsgBhrh1Uacl0PviavlDuNrKb65SVs8HTdtahJmnkqKOcCTUpUGQ9PAk4EG4a4JK/
         jUI8/Zg2sVty9UWBB8W299Z3XC6EnDkDyfpLv+P4KI40nAfS4VHcZq4vPhmQq1Yd4/Rp
         Rg+Q==
X-Gm-Message-State: AFq9FYLQGUiScUCDlg4HAZ9epR37VRw5XdKYl0VplHhVfcnjKIIG33Tk
	bZGER5DmvqaJLcrkrGaR9rz9fXBNQg4tN2wqptKmzo37k5wkl71OxfX3Nhx3EMma9Jc=
X-Gm-Gg: AYBFou1Q4n8ONGsQRRT1CdT4AnkDpIdgN12kH2D6DkSL3KmjNcnLw1QjTw1I8V57z0b
	XRE5t/I8i/RFSND0XYk0i7C80Gmt+PSA7aYFHWyOrOnNNW99TNins6+A9r3PuRXElF3pqpM4Fmv
	HtBKrgQ+waSkaqRPI5hr4KFP6XDEDYsJ/IqsC5KFcKmlRojDU1a3dygBhe69ad70uDit8j+cUjM
	AaFnHFFAdOvDf90pAbVNyta/39k8y0+Lik89i19Eq7HB6CbVysCFCanR59vJsuC9ochE5wnhcqn
	hMwys0xG2Qaeywk/BDAZudugTMINMxeYYe/Olj/BN112Z0Yh1vxx6AWD4ii+akdN6nRqFu1fhbS
	yfR3w7o9YAbCY+3v4qQV+aCYOpeCFFc7elx4UuXDTtUB/G/8VExNwh2PF/otF8Qi0Az/MYej0K7
	4YT/wWuw3ZejM/8RXmlq8SW31fQRxzZrkAhr76xYUGghN5EqtBZw8XG8xpI2oK45Pz/Ql+pLduj
	Vbd5uf2J3DyWBp1pMc1NZLSkwRFQZz3o7FxdYS7iRaiu4wFEDVfUkVdBG8kLk8UoCn0Fr00fUSe
	1QB02e566ThK1l1UNB/2nhGvWXilW0WX9yAc
X-Received: by 2002:a05:6830:7197:b0:822:27d6:c28a with SMTP id 46e09a7af769-85d362f2e48mr7714233a34.4.1793637149826;
        Mon, 02 Nov 2026 08:32:29 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d351e841fsm10329751a34.1.2026.11.02.08.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:32:28 -0800 (PST)
Message-ID: <97e486d7-b5e0-4293-8bce-75251f5d3c20@linuxfoundation.org>
Date: Mon, 2 Nov 2026 09:32:24 -0700
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re:
To: Regen Yang <regentropfen.yang@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <CAJze65gQg=q2OW-1n5wT6vah8FnjxD9rsPCsyg4HspOB42o53g@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAJze65gQg=q2OW-1n5wT6vah8FnjxD9rsPCsyg4HspOB42o53g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/26 12:20, Regen Yang wrote:
> run_kselftest.sh sources runner.sh under /bin/sh, but run_in_netns()
> uses Bash's &> redirection for running a test and deleting its namespace.
> With dash, this backgrounds the command and performs a separate
> redirection-only command. Consequently, rc captures the successful
> redirection instead of the test status, and namespace cleanup can race
> with test execution.
> 
> A failing test run with run_kselftest.sh -n can therefore be counted as a
> pass and return success. The totals can also appear before the test
> result, and skipped and expected-failure tests are counted as passes.
> 
> Use portable stdout and stderr redirections so the runner waits for the
> test and namespace cleanup, preserves the test status, and reads the log
> after the test has finished.

Please send a proper patch with patch summary? Add output before and
after to the commit log.

thanks,
-- Shuah
