Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44CF2931FF;
	Thu,  8 Oct 2026 03:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791430596; cv=none; b=UZPoNJSTe7QY6g9HyGwSwRHm8kRDDdMLhwxHueLhwfi//LbpixFroLnFrhhWcK+TTVNP7UlikfPhZU+nPC8M8rFA8CQmePtT43Ju/OMJOl2yaJnFng2OxxEZWiiU1yvQrJJy82dhGPlVKf09AzUVkLFD1Hbr3lvdh72ORzoUUfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791430596; c=relaxed/simple;
	bh=NJI2DarabQhw4oFDCTnqXiYzHACu0I15hA60oDcCsv8=;
	h=From:To:Cc:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Subject; b=HD7eRc3IovP2fGmF8rFEpyR3Xh8msnnFbu9QSztoZnypjytgDkEXAAbOWrX5iJOTrw+cncs9tm+5AKN7kGK7LuueFOxtDC1De1L5pbhz9Nrf57aZWs5gdFTqzxw8MEpdPCkZnUKnWBIv5NGbd1nTvHvBqQU4su87MhljJabwp/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b=qnpInk3E; arc=none smtp.client-ip=166.70.13.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b="qnpInk3E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NJI2DarabQhw4oFDCTnqXiYzHACu0I15hA60oDcCsv8=; b=qnpInk3ELoCpBfqBY8SgNRUj71
	4XMk2ZWRs/TWoM2Kd2PI9sa60TfCjM/T4iY2WEYrMc14wo7qXFaLwSEOF0rr4XVe5WE/GG7gVmcqg
	3aAqdqfWMY0kCvowjS7tAxMhMhM1ENzxKTlaYRHtqzQxxYdxEfqysQ05hk2+HXMNL550=;
Received: from in02.mta.xmission.com ([166.70.13.52]:33546)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1xEdrZ-009cRS-8e; Wed, 07 Oct 2026 20:28:05 -0600
Received: from ip72-198-196-98.om.om.cox.net ([72.198.196.98]:54856 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1xEdrW-002F3x-Fi; Wed, 07 Oct 2026 20:28:04 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Natasha Klaus <natalie.klaus@runtimeverification.com>
Cc: Christian Brauner <brauner@kernel.org>,  Kees Cook <kees@kernel.org>,
  Shuah Khan <shuah@kernel.org>,  Jeff Layton <jlayton@kernel.org>,
  linux-kselftest@vger.kernel.org,  linux-kernel@vger.kernel.org
In-Reply-To: <20260930112854.373184-1-natalie.klaus@runtimeverification.com>
	(Natasha Klaus's message of "Wed, 30 Sep 2026 14:28:52 +0300")
References: <20260930112854.373184-1-natalie.klaus@runtimeverification.com>
Date: Wed, 07 Oct 2026 21:27:55 -0500
Message-ID: <87se2h0vv8.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1xEdrW-002F3x-Fi;;;mid=<87se2h0vv8.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.196.98;;;frm=ebiederm@xmission.com;;;sPfnum=0;;;sPf=pass
X-XM-AID: U2FsdGVkX19VFKwA3NX3XuLVxwVPhh5HhCK4fEnKK6o=
X-Spam-Level: *
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.5 BAYES_40 BODY: Bayes spam probability is 20 to 40%
	*      [score: 0.2387]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	*  1.2 XM_Multi_Part_URI URI: Long-Multi-Part URIs
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
	*  1.0 XM_B_Phish_Phrases Commonly used Phishing Phrases
	*  0.0 T_TooManySym_02 5+ unique symbols in subject
	*  0.0 TR_XM_PhishingBody Phishing flag in body of message
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;Natasha Klaus <natalie.klaus@runtimeverification.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 2307 ms - load_scoreonly_sql: 0.05 (0.0%),
	signal_user_changed: 11 (0.5%), b_tie_ro: 10 (0.4%), parse: 0.84
	(0.0%), extract_message_metadata: 13 (0.6%), get_uri_detail_list: 1.71
	(0.1%), tests_pri_-2000: 13 (0.6%), tests_pri_-1000: 2.2 (0.1%),
	tests_pri_-950: 1.09 (0.0%), tests_pri_-900: 0.78 (0.0%),
	tests_pri_-90: 81 (3.5%), check_bayes: 79 (3.4%), b_tokenize: 6 (0.3%),
	 b_tok_get_all: 8 (0.4%), b_comp_prob: 2.9 (0.1%), b_tok_touch_all: 57
	(2.5%), b_finish: 1.11 (0.0%), tests_pri_0: 270 (11.7%),
	check_dkim_signature: 0.88 (0.0%), check_dkim_adsp: 7 (0.3%),
	poll_dns_idle: 1889 (81.9%), tests_pri_10: 1.92 (0.1%), tests_pri_500:
	1909 (82.7%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v2 0/2] userns: reject out-of-range uid_map/gid_map values
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, jlayton@kernel.org, shuah@kernel.org, kees@kernel.org, brauner@kernel.org, natalie.klaus@runtimeverification.com
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out03.mta.xmission.com); SAEximRunCond expanded to false

Natasha Klaus <natalie.klaus@runtimeverification.com> writes:

> map_write() silently truncates uid_map/gid_map/projid_map values above
> U32_MAX modulo 2^32 on 64-bit kernels, so e.g. "4294967301 1000 1" is
> installed as "5 1000 1" without an error. Patch 1 parses each field
> with kstrtou32() so such values fail with -EINVAL. Patch 2 adds
> selftests for out-of-range and negative values in each field and for
> the unchanged in-range path.
>
> This makes the parser more correct; it is not a security fix.
>
> The patch and the selftest were drafted by Claude Code (Claude Opus 5.5)
> in an interactive session; I reviewed, built and tested them. The
> assistant flagged the truncation while reading map_write(), and I
> confirmed it by writing to uid_map on a running kernel.
>
> Tested on v7.3-rc5-37-g551c722f4080 under virtme-ng, x86_64 defconfig
> with CONFIG_USER_NS: all 12 selftest cases pass on the patched kernel.
> On an unpatched 6.8 host the four above-u32 cases fail as expected,
> seven pass and the root-only case is skipped.

I don't see anything to object to in this one.

Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

>
> Changes in v2:
> - Parse each field with kstrtou32() instead of simple_strtoull() plus a
>   separate U32_MAX check (Eric W. Biederman).
> - Selftest: add negative values in each field, "0 <uid> 1", the
>   largest valid first id, a line with extra spaces between fields, and
>   the largest count written by a privileged parent (Eric W. Biederman).
> - Describe patch 1 as making the parser more correct, not as hardening.
> - Rebased onto v7.3-rc5-37-g551c722f4080.
>
> Link: https://lore.kernel.org/all/20260928072537.115668-1-natalie.klaus@runtimeverification.com/
>
> Natasha Klaus (2):
>   userns: reject uid_map/gid_map values that do not fit in u32
>   selftests/namespaces: add uid_map/gid_map range tests
>
>  kernel/user_namespace.c                       |  29 +-
>  tools/testing/selftests/namespaces/.gitignore |   1 +
>  tools/testing/selftests/namespaces/Makefile   |   3 +-
>  .../selftests/namespaces/uid_map_range_test.c | 299 ++++++++++++++++++
>  4 files changed, 328 insertions(+), 4 deletions(-)
>  create mode 100644 tools/testing/selftests/namespaces/uid_map_range_test.c
>
>
> base-commit: 551c722f40809618230001baccf219193e22fc5a
