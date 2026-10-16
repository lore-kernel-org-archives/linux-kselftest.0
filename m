Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784C44FD289
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 16:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167488; cv=none; b=qszpEboDEEEvoVAdjraKa/9fcx9/M/MfsQyLAssbfdLKcTO7BTNVaooUOhvKgT0Nu/cbtDAGB44LHky3O9C95mL1m2FXqnjXvxjEPbX80fCGmGiiDbCFawTo0bNiKi8VHLxJO4pYYZIbkZCkP091a+H7Wi0AVl10ajf9W2g44N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167488; c=relaxed/simple;
	bh=nZWtbApWt3kV026dkoDNspJsmQaxaHBVELtY6w2UgGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YRlvAyAdeYdO19Hnjzt6KapCw3p4/VgP0QsIiU+RT4A3w4Vkj8ExTJcFpWK6ve04uH3HMJbCPKyJiJYLQRw6haqqaJF5++T+f+ZTdQS6hiraU1zMK8gcE0WKzThmzi7WSIbAyUiLezKjPnXm07gnXJs8mhWH/jtnptDvbHgylws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M3CpNeiv; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M3CpNeiv"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f48c750afcso886a34.0
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 09:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792167479; x=1792772279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/aqB/Mmx2mmYZsJMDrgp07ogosIeUVeJwoNnZHzHvsY=;
        b=M3CpNeivZfD2Yrd3gUdREx/HDMNqlNOpX4xlFZRopPaDnqpqK9FF4rNZG9bBbxuPtx
         rVUaIiM31BfaYxDtDVTibXZ2LufgGbCGDw0tKWMYG18+sYEZTrZDwXQW6qN8wvLackjD
         3eA1+y1A60rnAfmqUeg3bK8FhHqvKWEQDU5u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792167479; x=1792772279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aqB/Mmx2mmYZsJMDrgp07ogosIeUVeJwoNnZHzHvsY=;
        b=xQfNB20iAXvEXJFIyPquyZlI+UXdqofeuqEgZs98cFkXehwwfIIbZtCNSc7UpPk8Eb
         MlEEwa1twD4zw8O7S0ZgOKEi+veEj8se9mcf3Hfq/eFbFN5bP9QwwhH5dDfuUDuMfC86
         jQY5uNb2keVt4zHOIeVUSsygBtDN2rrt+erp0YrMjPMboG0bv/L97HNGeHHQ8weoWsCa
         NmGNX84rp4O7gQWGQQ1XIE1ev5XctyZBFk9GHpnCuGH74TLpSvLZv2gP3Gj0NMopSg2m
         liOPKXVUYgBGoeTHw6aEeptqJEEb12tSnrFI/TTjk2Vf9jjLqdSg64RMiINOzgcL19U7
         L8Ug==
X-Forwarded-Encrypted: i=1; AKwUvBwJM3GnwCYBcAgTRVMluAZUMjIg3ZIe0BNNj04orkrgWpXrZGeo37Crz/mcocIZ6iOFGuphbmS2ULSVy2n/4bA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNUBF3KTOUYqQqEfAjFisMIlvNJgzT3avbfNq2gFKavslBdnv9
	QWyWKPpASUx1m0qNlvyBnne5yjOvD95Ol7g8kgJEvdNcarFgRMpXAXv9g7qYHyE0uZ0=
X-Gm-Gg: AYBFou3dIU1RqHNG7VBKyy0SFAWE5LjONer0sTF8HXHdi36d5n/fzw17B0ICbjgkFXx
	EQWWfh7G2KBifiaCyu+/yydOx7iFgNzDAdgBOu7c6xA3RrQXAZ3eYyEhylK1WD+YR9yHdMh9AJQ
	QM0nTRJyPCrjoc4ITDZhcT58OTWSbkbagERl/ArxIZEyd4OxAZlvfE19YfeaGQZ9ZmzZ1XqMI6N
	ktN1SGxy8xHI0XXC/lg9eMWQM+afcAyUJojlLB209TuqBEZ10SF7ublG4tiXi1WXK/xkrYPHWgJ
	YP+0mKhuWpTz45vTiUbwzusezOknERxsOnX4skfknFqScIa+tizPiE/LuaRP/50Wf9XxAdcA5Kb
	Bv4/a4FQ/MAyhSBKfOWdhPXfo1c39Gjn5dIfzGqhJaOup6fNUWSE4rCrid/Vwj4D7lH14N07/aN
	zBk9AzBdyfSpxaZVi+1wHnUyh9HZw4aR644Gqk7wIZ45IdDDDbs2AfUaUeFt1YPHBgRNrRDsDWw
	pJTANh0J+Ft3Vv86Z4=
X-Received: by 2002:a05:6830:828f:b0:81d:c548:292f with SMTP id 46e09a7af769-830959380b5mr21128096a34.12.1792167479094;
        Fri, 16 Oct 2026 09:17:59 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a6f0a55csm2327426a34.25.2026.10.16.09.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:17:58 -0700 (PDT)
Message-ID: <93d5f73d-0126-4727-9014-836e195a3eac@linuxfoundation.org>
Date: Fri, 16 Oct 2026 10:17:54 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 5/7] tools: build kernel selftests in tools_build
To: Sasha Levin <sashal@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, linux-perf-users@vger.kernel.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261016143143.3613501-1-sashal@kernel.org>
 <20261016143143.3613501-6-sashal@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261016143143.3613501-6-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 08:31, Sasha Levin wrote:
> Add a "Kernel selftests" sub-menu with one entry per selftests directory
> that builds with only a C library and does not write into the source
> tree. Each is built as "make kselftest-all" builds it, with KHDR_INCLUDES
> pointing at the UAPI headers installed in the object tree, but by its own
> make, so the selected ones build in parallel. Selftests whose Makefile
> does not use KHDR_INCLUDES still build against the C library's copy of
> the UAPI headers.
> 
> As with "make kselftest-all", a selftest that fails to build does not
> fail the build unless FORCE_TARGETS is set. kselftest_deps.sh then lists
> the libraries the selftest needs that the compiler cannot link with.
> 
> The selftests do not track header dependencies, so a selftest is built
> again from scratch when its own directory, a header or makefile any
> selftest may share, or the kernel sources and headers it includes (the
> vDSO test includes the architecture's vDSO code) are newer than its last
> build.
> 
> Selftests that need libraries beyond the C library, a vmlinux with BTF,
> or a sanitizer runtime are left out for now.
> 
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Thank you.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
