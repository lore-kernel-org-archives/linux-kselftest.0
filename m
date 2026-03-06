Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4B67E0E4
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 14:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807903; cv=none; b=gxPKQgW5xb1UDZ3m3Z6AqXVYGQA0P49gd/3b6DOWnrwcfGHwoXsjWbKyUEsv5x/6hUh6G7BC5a75iWdUR6VcjIuTX1mgDUs5zdsDr6Esul0KLx6O9VMIF6i4M82nnF9BH6Jj18XWL2UzIpwLkcU5qEQ/RFSIq/Kf/x2Wbf0ay6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807903; c=relaxed/simple;
	bh=vy9qDHQE9TnWOPW1buR+83iNmNCigIukqJRH8YmZRoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhC3tFXCTrAb8UPBU6QDp0CugLaRBpQjsjCzxYflnT0B7K72Aj9gxhHWwdEbpf0Lzxf//D+anf/kh09DtWwNccQx1M4nhlR36wcu+I9h0anTBZfp6uQ3aXHTgKF+koUos8mbwVOrOTA+mJIJ9NV4F2j1WQQ0UdzkuRE8SnQ/9C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MCyZiSkf; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MCyZiSkf"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b9b1900bso4200452f8f.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 06:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772807899; x=1773412699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VN+ccTSTkmIhecLGiyEENku0saMX3lI6yYuM887yi+c=;
        b=MCyZiSkfmeTkS4fR0sngY7+Qgm3Up3XKnqP6vvxYh0vSasvNA8+gpJ005v9/nnQW2D
         ey89bKLd7BydqFkRvaSo2ZEe4URk1vzPWdlXGYtQ89Xh0MxEX8Fcojk3M1Uz5f0gnAMW
         F2Ebx0Qe2fYeMphApjTANLcpkOexUT2nQiahUCeF/e5Cg5quEOoRi+UDO6TJZXmA/fie
         2dnO0IvDBWaScikT5fTR+JxnatwVlq+8+lCqRB8YY2RglmMSe6cA8kYjKG5hyzat66KU
         mge2BkFI/tWRqel8/qO/elMvLYH2zAcYcw9EiexMI0eRTNkmmbdty/FR/nhTY3KlEZGM
         i9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772807899; x=1773412699;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VN+ccTSTkmIhecLGiyEENku0saMX3lI6yYuM887yi+c=;
        b=kms0c+flOnoKbEQPQl8OZBaPcmoLgz5bqMq4MyO6mf6PzJmeSI7MpIqPsfXZs8XJ4F
         m8Fsdzi55KIdcYWtWAo9sf62n3Z7P7RhqfDGG7IHtwddDZvqWThNjPFU0npcfqA9I/sr
         sDLLIpp7tuhIkIi7HaOxwfjmwn3a64LIxt+sAz6Zw6i+ZprSFpGDi9mC6L6iQ8rTCtxI
         f1izy1F8iLSlQRwqJnqHXa8lI/6NVwFh4lNhsZbSlbqkmRyyRV7SgymoBvpUuPUxjYoU
         n8MysfMMDTHN6JhSSHJ8fmp0T+rQO/4sRGSpIvpOXvbbtUBagiVflIV7WuK8bbgk0d1U
         UHpA==
X-Forwarded-Encrypted: i=1; AJvYcCUaKvYct69zoPAfbeU2BIYXT9u3rNq8GQcPx0HnM7jfZ0VzWmzyqfQPXS+BLyHTEoSUGort0P5AsWFspD4YlQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq8zeCU/lRd+02mFoZmV6v/kApVVzdZ1JzMOYyQC4dNFc5bRcq
	BPptnxs3yj4fs0ftrrJ+4BmiapBjSJc80Gha3q7W24l6Nw3y/q9gcTE8gpeD5CL2/4s=
X-Gm-Gg: ATEYQzzNOO9DCKQBx2GiCu8uF+wVVitszGryMYZncnWhFqkdqaKzQD8iZYQIt+21gYy
	wvLoHxnYc6viYxkflsxKMWKV9TeKurPXLj1DRIaqXFCh+/pWSH7UlX+ZNqhFs9zYNxtyOPNuVbP
	F6ueVf4OwGpfMTdqEEN65V8xtKhZymOEq8SxrGhBvcRbAWi7pJsuc55ugCD49OTfnbNNQyNhvb1
	CJddBnbsbb8Aaa5obB3Pa/YnBWXUzhj9zrsNbwFWTkQeqOFN0i1nk3/3m3OknuHeZO3uZJaOMNm
	xkHtagGSl03JWj8dQ37Iee+iJHEP95gL07A08iirkkHBYCpZQJWLIB1hRQOfEOpKLQO0ZPGaWBW
	lUZuKWV17ddwShBRrRnGUmqHRm05OgEFmMR2BGRYeZKG3DpCSB5eXTupnWpVlYfeSs2FVb+Uers
	wvioaX9KyumiRjaZORnSXkm0SEeA==
X-Received: by 2002:a05:6000:4313:b0:439:a95b:3c43 with SMTP id ffacd0b85a97d-439da65e31amr4194449f8f.21.1772807898957;
        Fri, 06 Mar 2026 06:38:18 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8dbb3sm3821241f8f.4.2026.03.06.06.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:38:18 -0800 (PST)
Date: Fri, 6 Mar 2026 15:38:16 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests: livepatch: functions.sh: Workaround
 heredoc on older bash
Message-ID: <aarm2KYH3ZsPnuJN@pathway.suse.cz>
References: <20260220-lp-test-trace-v1-0-4b6703cd01a6@suse.com>
 <20260220-lp-test-trace-v1-2-4b6703cd01a6@suse.com>
 <aark_LapcGkPjrLu@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aark_LapcGkPjrLu@pathway.suse.cz>

On Fri 2026-03-06 15:30:20, Petr Mladek wrote:
> On Fri 2026-02-20 11:12:34, Marcos Paulo de Souza wrote:
> > When running current selftests on older distributions like SLE12-SP5 that
> > contains an older bash trips over heredoc. Convert it to plain echo
> > calls, which ends up with the same result.
> > 
> > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> 
> JFYI, the patch has been committed into livepatch.git,
> branch for-7.1/ftrace-test.
> 
> I have fixed the typo reported by Joe, see
> https://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching.git/commit/?h=for-7.1/ftrace-test&id=920e5001f4beb38685d5b8cac061cb1d2760eeab

Grr, the above was meant for the 1st patch.
This 2nd patch was _not_ committed.

Best Regards,
Petr
