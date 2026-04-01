Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B2F224B1E
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 01:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775005516; cv=none; b=u7kGj5cg7ASCQBtwB+Es4IJErFxEk0hESaUkuR9V4Jnps/bhtmbKzeflM5AnDI/p5CQNvLuH8BpM3FDDg4RBtLEfZHmBLTqYuRbcdwrmMgHKOP5s9uX7UlljA/9xUboHpS+8mSOHSiRAvSUW0vXoFPVzR1B3T3fp6jYSMxyyIBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775005516; c=relaxed/simple;
	bh=CPNTE8tzCVGAOF9o8mcrIX6f6heRWkwKn0jZAUVBrzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JEvAqpv/1wYzXBp5slTGPC8AKwuS1V+VCyjcpZ+xw3GUqZICBI/nfMEnUvGWoDg+H6Q9ggXRTPYLpeSFTVSRVkylGaONlg7IXAbEM4w9Oa4Vmp4p6QZFWd4Wvm/taCcKT01ES5jcTmFMSynTJv+oksQUSJCgBFL7yElrAxmGsaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pNZJEJjb; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pNZJEJjb"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35d9827661bso1931419a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 31 Mar 2026 18:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775005515; x=1775610315; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7z1thZP8yYGMiKbnDNmtSPLqeR+cQiCFdf1/ng8Yk70=;
        b=pNZJEJjbrH3rGiXc+ByNjP0fJerKZbdQqmacId6VzwU0f50yW8jOmDzXecE0oLiRtG
         KDQsmTC7futfk3D9FmWUp4is0/zKIHlg17lL4oJHYkPms976XUYb25sibjzPH94HHtDu
         mplQqB4hTA1d7Xol9x3NZCAlMqLD6xpzZPMT/d8ss1qZsQn1nnlv60qVhSWD3/X+kUmo
         DRBUiCnZSQ2hj75Nu98lTMwVfvGMg95f+QRpX8mKy8vEqk5S58yaIjgSotQXtofrNTGW
         FUfWbonLy2U5aT6WK8T5TyfNqboxINsMsRyJYmKA+HDVAy7JT1ZN6tf9pzeNas+KpI6z
         0v6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775005515; x=1775610315;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7z1thZP8yYGMiKbnDNmtSPLqeR+cQiCFdf1/ng8Yk70=;
        b=h4at6TkC0zVGn7VtistRSTcQckzBxlaOyMGlhdFV0hDpI/hm42SwtESVWHh63LBfTk
         5L3esOeGQtmie1FgyNR3Irpu5PL9hLccDBPdtdLJAvaKX6QPlhMx6/q2z2RxN9k7JvVj
         gqLSHGi1NspUPMKTybTTtysdjTspAuxNAVU1QY7zLiXmtF975oyE8ij7TWfzaWRbjELP
         HREOpWJyticfrwSWkIVScghL7JiXplAiYYkLTvmS048XgomdkDjXgNiTqn+U36cSBrUu
         6k6u7Dfg3MOjPUQtzWaHkeq+95zVYoDw8kQZWb4pmZWjsyJSHtqDFMh/dT2VWdUGHcq4
         3U9w==
X-Gm-Message-State: AOJu0Yy007guRPEi5VCdFOLfrW3eyZ3Y99lUGxRBnOfFRYThOZGakiaJ
	L8QW1Ji/pp/7zjoaiF9LM5I8DGhha2q84j2s9Uugi5NWgN3gduGSxYrM
X-Gm-Gg: ATEYQzznntQLsgVOk3OR+MkH9deVgNJGq2U2uvY7uuki8dThexiEYUlfKqL8X2oa213
	k3gM+RYCHwNTI0qaJX7BsdUTkWM0jZQMBs4FklJyAkVp6b9fwfasKtbEV7SA2G8TzBd61xGd0Yk
	9mQt8t+o6YW+EH1PqM66lm2qKCQbwNoP+nGQ1KXr6Me5FzNWP0Gzgt4dVL3UR09/QyfMyjxG+L8
	TsA8CHGQPGe6JU0uxXZSm7h/6f6s5A/nqWih9otf+zEnGH1OM8RlKBLNSnHUq42BKziUs0/5A4A
	H3k280cLSC13h8gEX4VXAy5Yug1EHAhjUcHZ2FPMyrLzlqMhkMWUSMP3KaAthdVRL7NipvH+jZv
	RKO0O3Yd19SXaSU3R5zqOiZw8GRbiZFHTTRfojG95QHMiCkF/Tm+ElDZkmqpwDpUZADZrw5zQRr
	SNOJuTFPMDyNWJLQ1D/scZgcJ6xdY=
X-Received: by 2002:a17:90b:57c6:b0:35d:a542:2dcb with SMTP id 98e67ed59e1d1-35dc6fae2ecmr1289781a91.16.1775005514806;
        Tue, 31 Mar 2026 18:05:14 -0700 (PDT)
Received: from fedora ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe5e4ba7sm2824076a91.4.2026.03.31.18.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 18:05:13 -0700 (PDT)
Date: Wed, 1 Apr 2026 01:05:04 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Brendan Jackman <jackmanb@google.com>, netdev@vger.kernel.org
Subject: Re: [PATCHv3] selftests: Use ktap helpers for runner.sh
Message-ID: <acxvQJsySH0NBmB1@fedora>
References: <20260225010833.11301-1-liuhangbin@gmail.com>
 <014b54f0-c4a6-40f2-afd0-0ea3e2f796e4@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <014b54f0-c4a6-40f2-afd0-0ea3e2f796e4@linuxfoundation.org>

On Tue, Mar 31, 2026 at 02:51:48PM -0600, Shuah Khan wrote:
> On 2/24/26 18:08, Hangbin Liu wrote:
> > Instead of manually writing ktap messages, we should use the formal
> > ktap helpers in runner.sh. Brendan did some work in d9e6269e3303
> > ("selftests/run_kselftest.sh: exit with error if tests fail") to make
> > run_kselftest.sh exit with the correct return value. However, the output
> > does not include the total results, such as how many tests passed or failed.
> > 
> > Let’s convert all manually printed messages in runner.sh to use the
> > formal ktap helpers. Here are what I changed:
> > 
> >    1. Move TAP header from runner.sh to run_kselftest.sh, since run_kselftest.sh
> >       is the only caller of run_many().
> >    2. In run_kselftest.sh, call run_many() in main process to count the
> >       pass/fail numbers.
> >    3. In run_kselftest.sh, do not generate kselftest_failures_file. Just
> >       use ktap_print_totals to report the result.
> >    4. In runner.sh run_one(), get the return value and use ktap helpers for
> >       all pass/fail reporting. This allows counting pass/fail numbers in the
> >       main process.
> >    5. In runner.sh run_in_netns(), also return the correct rc, so we can
> >       count results during wait.
> > 
> > After the change, the printed result looks like:
> > 
> >    not ok 4 4 selftests: clone3: clone3_cap_checkpoint_restore # exit=1
> >    # Totals: pass:3 fail:1 xfail:0 xpass:0 skip:0 error:0
> > 
> >    ]# echo $?
> >    1
> > 
> > Tested-by: Brendan Jackman <jackmanb@google.com>
> > Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
> > ---
> > 
> 
> Applied to linux-kselftest next for Linux 7.1-rc1
> 
> I had to fix commit description and long lines in change log.
> In the future make sure to run checkpatch to catch errors
> related to commit descriptions.

Thanks, I will take care of this.

Hangbin
> 
> thanks,
> -- Shuah
