Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7098B3093BC
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 16:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771863712; cv=none; b=ddmyMNOL3SEBCSmzGQ9G+O8jwWvk3vYIhRI0LENfKswroF/WR3K1aTAWyAVKWlVcrDOgb7E0LHValFreR7+0963pxhWgp1d+hNpLdmTogL2+JXdxsIVyyXzPU4WmyNPLIEwmk4xhdQdBeNYczsx3wB07PFLwS5Nthrh0RlxAIoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771863712; c=relaxed/simple;
	bh=cZdjdaZOcsXK6GsQf/mEIq7Qdmf7HWSKukscx0FcygU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eb1OwrpdGfgMmG6ReoDHirHxjtCc7anqSJuwzRmW8FdE82K3rRDYqz0unfaMievzSeT/pfdS2hKY51lk8VOf1jQV5o6PSmKh0vj8lT3oSiWeIFb2N/1vXWUnNxfa8fZHJX8pMKxTo7yjjxJVMoh12+6PJytKmGd0Bymtq8WGKgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AdjPnyqv; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AdjPnyqv"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43621bf67ceso3020895f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 08:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771863710; x=1772468510; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E12DLppc9zEwEUJULEgbOPg9LHuCkYx1Y+7qBt2BKRc=;
        b=AdjPnyqv0QCL36Ta+bRjeVvowMl5s9TcXCppQhECzdRxr9lx5R4RSUI1lebk/lc1rj
         sVUFf0sQegOvTqrirJZYRqIEVDvPIineIT+3OC7mdxrO7I6EDdKb1qgQt0nJl1NobAo1
         xfjkKqIcV64S4FRlWdnTaBa7248Wi53ssF0xGgtXY+IwtQNbarcQFTxzRPfWJFkUq2Rn
         U0kFzy7eVLd612fGUbiyXXSrrjxupHSECEQYA5z+vFs/COu2AO/lwh6ZVs0nXVgT7ysV
         VedDkWY80HnnGF7N4kvGosnL9t3q4ebnKV39lPmH/DCRIcom2SGwHQGHaRYl/nzvVLfN
         Igrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771863710; x=1772468510;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E12DLppc9zEwEUJULEgbOPg9LHuCkYx1Y+7qBt2BKRc=;
        b=LHTEwZjM00aFEw+m36gtog3RJLhmd6jpCg2KtHDyqRALKe/i1z1FAHs4+rhOM/xrrZ
         F+etKE2HOel2f7vp34bucezfL5feOj/5LOtfZf4hBmGE4sRYLpYy+uj7pHTsoTr5e8kB
         +TuFkFKcexTJFBbubiCD9+ZuQDotMj+a/ccNBCOZP3AjtTAvEuKfs5iIeMvy7z5ZRLTd
         LigHkGVVwUElfCYGnVLQV6HWP2CHGdcQpNqjiySM/DEDrl1VCstwhuuZZwVANehQCR5Z
         JmcVrnz8Wj3i1HFjzcYxPB8ClqxPu1RCUK5jrvIsUvZn9fp918fgKPzVwQhlrBruqGx1
         VeYg==
X-Forwarded-Encrypted: i=1; AJvYcCVitZ9NYLJra1m5StUiTUhCnqphVEEceT8VQOZh+4RVR5cwlRi8fdVoW7Y/gCDgjhjddgonYt9ynnjJboo2HpM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz0Phy0IzU844uS/zAx88xAiZw96rylY6uEFe3wjgMBL1qovfX
	/tEvpKa7cdALzDCfixdplziELdnMWrT9oYGKEPQC5Xvau5aMsRG5LVMhJbH561ppFHQ=
X-Gm-Gg: ATEYQzyL36iupujd5j5b1/up76xsO7b7o9z5TDK0jalHIEvFYamnX4p71yS6OrahQGp
	zJ96UpP+pQIFV5Ncki+lzswgLeziCZjDsqD3lLPsMF22LlS58nD52Ws6eDza1zw3wJq0wnM7yUf
	nOdDA0yNqWt40rRbfgLTVKeD+4gA5YkQAFOGRbqZfhjjFEACkKpbEIEHrjmM+y/jFUUnFh3cpmj
	VkQ1VoZRFLkRwmbJ2RgTLHSFP98ZszFKjIvNMYfmff+YQiNboUkCAxqYFs0vbxK6IFhg1XG48sA
	DegeAuMw1JgPEKn8896p3ZH/xGeF73KdNTVwuAJzc+oSwjGwMNS2JatgRVSaIA/1zugjPFjwzGj
	Z4vJlvx1JKoo0z8pbhcJwDro1wHVfh58l9lQcbTcNA1zwOyRqvRpGysuU9a6lM4Wbxw/1GzneX5
	ONFtGQYMkZWriiQL5/ZAGFVppi64BqVH5Hvq+GMEy+OUM7izjwfL7JBulrF/smBQ==
X-Received: by 2002:a05:6000:230b:b0:437:71cc:a246 with SMTP id ffacd0b85a97d-4396f153cd2mr18596170f8f.10.1771863709655;
        Mon, 23 Feb 2026 08:21:49 -0800 (PST)
Received: from ?IPv6:2804:5078:822:3100:58f2:fc97:371f:2? ([2804:5078:822:3100:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00e8bsm16973432f8f.15.2026.02.23.08.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 08:21:49 -0800 (PST)
Message-ID: <5ca16692b304185df695e517434b16e59cb15a42.camel@suse.com>
Subject: Re: [PATCH 2/2] selftests: livepatch: functions.sh: Workaround
 heredoc on older bash
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes	 <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Shuah
 Khan <shuah@kernel.org>, 	live-patching@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Mon, 23 Feb 2026 13:21:43 -0300
In-Reply-To: <aZx1ViTc7NJws-rf@redhat.com>
References: <20260220-lp-test-trace-v1-0-4b6703cd01a6@suse.com>
	 <20260220-lp-test-trace-v1-2-4b6703cd01a6@suse.com>
	 <aZx1ViTc7NJws-rf@redhat.com>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-02-23 at 10:42 -0500, Joe Lawrence wrote:
> On Fri, Feb 20, 2026 at 11:12:34AM -0300, Marcos Paulo de Souza
> wrote:
> > When running current selftests on older distributions like SLE12-
> > SP5 that
> > contains an older bash trips over heredoc. Convert it to plain echo
> > calls, which ends up with the same result.
> >=20
>=20
> Acked-by: Joe Lawrence <joe.lawrence@redhat.com>

Thanks for the review Joe!

>=20
> Just curious, what's the bash/heredoc issue?=C2=A0 All I could find via
> google search was perhaps something to do with the temporary file
> implementation under the hood.

# ./test-ftrace.sh=20
cat: -: No such file or directory
TEST: livepatch interaction with ftrace_enabled sysctl ... ^CQEMU:
Terminated

Somehow it doesn't understand the heredoc, but maybe I'm wrong...
either way, the change has the same outcome, so I believe that it
wasn't bad if we could change the cat for two echoes :)

Either way, if Petr or you think that this should be left as it is,
it's fine by me as well, I was just testing the change with an older
rootfs/kernels.

>=20
> --
> Joe
>=20
> > Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> > ---
> > =C2=A0tools/testing/selftests/livepatch/functions.sh | 6 ++----
> > =C2=A01 file changed, 2 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/tools/testing/selftests/livepatch/functions.sh
> > b/tools/testing/selftests/livepatch/functions.sh
> > index 8ec0cb64ad94..45ed04c6296e 100644
> > --- a/tools/testing/selftests/livepatch/functions.sh
> > +++ b/tools/testing/selftests/livepatch/functions.sh
> > @@ -96,10 +96,8 @@ function pop_config() {
> > =C2=A0}
> > =C2=A0
> > =C2=A0function set_dynamic_debug() {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cat <<-EOF > "$SYSFS_DEBUG_=
DIR/dynamic_debug/control"
> > -		file kernel/livepatch/* +p
> > -		func klp_try_switch_task -p
> > -		EOF
> > +	echo "file kernel/livepatch/* +p" >
> > "$SYSFS_DEBUG_DIR/dynamic_debug/control"
> > +	echo "func klp_try_switch_task -p" >
> > "$SYSFS_DEBUG_DIR/dynamic_debug/control"
> > =C2=A0}
> > =C2=A0
> > =C2=A0function set_ftrace_enabled() {
> >=20
> > --=20
> > 2.52.0
> >=20
