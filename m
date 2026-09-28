Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D404BD79E;
	Mon, 28 Sep 2026 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605478; cv=none; b=eWKyHhF+yaGb3MDhPFGujGRLE/9WB6R3Zysll00TKy+sulLO2hbd2plR4elbbB7Nc77kcUijGEzByfYWlq1pmcKAaza1JXf2A6uqCM0S7/dEPe2hCV6qMDyAqQHBiAIyqWKp/+EQ1utzVJ0QZFtsd2JPtS1BWLdmRABDYJ84zcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605478; c=relaxed/simple;
	bh=TUPQiWGaksxIu2jhdVNuvKfToIZjUJ7DaiDHclCajrk=;
	h=From:To:Cc:In-Reply-To:References:Date:Message-ID:MIME-Version:
	 Content-Type:Subject; b=INLlm6Hc/AAqKlObHRiuw//dq9O8xR0hUwtXlvcUUy7hNc9oGfbm4c4TtKXbnA/ppri756pzHqQGgbOAipVN3VtbpWqLfbOOpcVUL74nqWOaAOw4yzgBv+eZrgc+2NmB8kd+Y6Rq71/EkpcFi/fZAV/2YX4FEcaM9NUBgagWjWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b=iA/e40Oi; arc=none smtp.client-ip=166.70.13.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xmission.com header.i=@xmission.com header.b="iA/e40Oi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TUPQiWGaksxIu2jhdVNuvKfToIZjUJ7DaiDHclCajrk=; b=iA/e40OiNdjs/TZNZHRrMawsgW
	RUWY1gEhXKNkRcf45y4kfcnfLIHQEz+VrkOP4xqH1B0t+AhKgu3Xaj/03o/WrIncxl5FvGk2nw/dD
	B3sfypnEAa8raf4UXYXrrIFYwCr+6ReAShD4A6BN9WyuVQfuAsrHe3qpwMGrW6darQCQ=;
Received: from in02.mta.xmission.com ([166.70.13.52]:33258)
	by out02.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1xBBsb-0004ul-Sg; Mon, 28 Sep 2026 07:58:53 -0600
Received: from ip72-198-196-98.om.om.cox.net ([72.198.196.98]:44176 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1xBBsa-00GCOe-Se; Mon, 28 Sep 2026 07:58:53 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Natasha Klaus <natalie.klaus@runtimeverification.com>
Cc: Christian Brauner <brauner@kernel.org>,  Kees Cook <kees@kernel.org>,
  Shuah Khan <shuah@kernel.org>,  Jeff Layton <jlayton@kernel.org>,
  linux-kselftest@vger.kernel.org,  linux-kernel@vger.kernel.org
In-Reply-To: <20260928072537.115668-1-natalie.klaus@runtimeverification.com>
	(Natasha Klaus's message of "Mon, 28 Sep 2026 10:25:35 +0300")
References: <20260928072537.115668-1-natalie.klaus@runtimeverification.com>
Date: Mon, 28 Sep 2026 08:58:46 -0500
Message-ID: <87tsn932ax.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1xBBsa-00GCOe-Se;;;mid=<87tsn932ax.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.196.98;;;frm=ebiederm@xmission.com;;;sPfnum=0;;;sPf=pass
X-XM-AID: U2FsdGVkX1/NilCz1i07GshbSNFOsN1HnhcVs7m55w0=
X-Spam-Level: *
X-Spam-Virus: No
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.5 BAYES_40 BODY: Bayes spam probability is 20 to 40%
	*      [score: 0.3050]
	*  1.5 XMNoVowels Alpha-numberic number with no vowels
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa03 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
	*  1.0 XM_B_Phish_Phrases Commonly used Phishing Phrases
	*  0.0 T_TooManySym_02 5+ unique symbols in subject
	*  0.0 TR_XM_PhishingBody Phishing flag in body of message
X-Spam-DCC: XMission; sa03 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;Natasha Klaus <natalie.klaus@runtimeverification.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 521 ms - load_scoreonly_sql: 0.05 (0.0%),
	signal_user_changed: 4.6 (0.9%), b_tie_ro: 3.2 (0.6%), parse: 0.96
	(0.2%), extract_message_metadata: 12 (2.3%), get_uri_detail_list: 1.40
	(0.3%), tests_pri_-2000: 17 (3.3%), tests_pri_-1000: 2.8 (0.5%),
	tests_pri_-950: 1.63 (0.3%), tests_pri_-900: 0.91 (0.2%),
	tests_pri_-90: 146 (28.0%), check_bayes: 139 (26.6%), b_tokenize: 7
	(1.4%), b_tok_get_all: 8 (1.6%), b_comp_prob: 3.8 (0.7%),
	b_tok_touch_all: 113 (21.8%), b_finish: 1.38 (0.3%), tests_pri_0: 317
	(60.8%), check_dkim_signature: 0.63 (0.1%), check_dkim_adsp: 5 (1.0%),
	poll_dns_idle: 1.89 (0.4%), tests_pri_10: 2.3 (0.4%), tests_pri_500:
	11 (2.2%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH 0/2] userns: reject out-of-range uid_map/gid_map values
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, jlayton@kernel.org, shuah@kernel.org, kees@kernel.org, brauner@kernel.org, natalie.klaus@runtimeverification.com
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out02.mta.xmission.com); SAEximRunCond expanded to false

Natasha Klaus <natalie.klaus@runtimeverification.com> writes:

> map_write() silently truncates uid_map/gid_map/projid_map values above
> U32_MAX modulo 2^32 on 64-bit kernels, so e.g. "4294967301 1000 1" is
> installed as "5 1000 1" without an error. Patch 1 rejects such values
> with -EINVAL. Patch 2 adds a selftest for all three fields and for the
> unchanged in-range path.
>
> This is hardening, not a security fix.

Well error in more cases.  *Shrug* I don't think that even really
hardens anything but it is moderately more correct.

> The patch and the selftest were drafted by Claude Code (Claude Opus 5.5)
> in an interactive session; I reviewed, built and tested them. The
> assistant flagged the truncation while reading map_write(), and I
> confirmed it by writing to uid_map on a running kernel.
>
> Tested on v7.3-rc4-393-g165768bb7026 under virtme-ng, x86_64 defconfig
> with CONFIG_USER_NS: all five selftest cases pass on the patched kernel.
> On an unpatched 6.8 host, four of the five fail as expected.

Storing an unsigned long into an unsigned long long instead of an
unsigned is a mistake in the opposite direction and is more costly.

A more targeted fix would be to replace simple_strtoul with
kstrtou32.

As for tests you probably also want to test some negative values as
well, and probably a few good values.

Eric

>
> Natasha Klaus (2):
>   userns: reject uid_map/gid_map values that do not fit in u32
>   selftests/namespaces: add uid_map/gid_map range tests
>
>  kernel/user_namespace.c                       |  14 +-
>  tools/testing/selftests/namespaces/.gitignore |   1 +
>  tools/testing/selftests/namespaces/Makefile   |   3 +-
>  .../selftests/namespaces/uid_map_range_test.c | 155 ++++++++++++++++++
>  4 files changed, 169 insertions(+), 4 deletions(-)
>  create mode 100644 tools/testing/selftests/namespaces/uid_map_range_test.c
>
>
> base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
