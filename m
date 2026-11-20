Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.121.94.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173286;
	b=w+s2g3y4ctv7+3dEdPk31u9AANqK5+IJ1KYrIxm2hgW3cUByk7RTvu6YdXl0NYfPMnyq
	 rKCdJyPyO+J6+xOgnLbgXSRgAvUR9IYhdKMnE+i6pjhWuEmIj2xbXEpmnvE5TVpCSuRKw
	 +7lE7iMMdHNqzVQahIAi/WXoFauHTj4jaOIeOwuzlVqNbQLGNA1tVipid+dFqKjc4QzQq
	 +UA+0iJ6jIFNSAhP0zXCjAFg62Obk82uMr4Jp4I+RkiwiFXAPx0yXqpidP1xDv5LyI+19
	 GbEwLOUq+3RGJaVi70TeCCGIbQ3x/Ux67F6nOLdG7WJRvZCc34a26p2TFJSp3KiGfkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173286;
	h=DMARC-Filter:X-KPN-MessageId:Received:Received:DKIM-Signature:
	 X-KPN-MID:X-CMASSUN:X-KPN-VerifiedSender:Received:Date:From:To:Cc:
	 Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Priority:Importance:X-Originating-IP;
	bh=PjzVgZGUm3JAnCCIs5JaL2TnGj38tBHNtriCyFT2Wzg=;
	b=4N6BBA1m6GKW3xp/Inru0o/KtFbG/yAPjB/3RdpIxE42W56ZJWLuES6UeAg5TwhK/nGY
	 BZJYPjCe0LFXkvEpjuWaXHxQKZmfzMKmv+60xaCpXg9uXLISndsCNO87Bq48RBL3g8YLr
	 bbtbo0mPwre7WD5eB0uEW128i7vn7uYwNpXpH1SFQdhRKYuxqmkUvHi60aHAZskW6ZlLe
	 gMcOdLJbnpUZfpIihqZFLSNtCzBcV740b4hiNozIKSr2sKDF+jz87hu5p/pPI6CyLYmQC
	 latkUfsPq3e0CznkJs+ECdiOfCqWZdnzn4484Bjz1qADUC2QmsPM8M21c0UHWYVU2YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xs4all.nl;
	spf=pass smtp.mailfrom=xs4all.nl;
	dkim=pass header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=ucC4Rj6u;
	arc=none smtp.remote-ip=195.121.94.183
Received: from ewsoutbound.kpnmail.nl (unknown [195.121.94.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090AF606A33A
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 11:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 090AF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=ucC4Rj6u
X-KPN-MessageId: 9224ddf7-e4d3-11f1-8e5d-005056992ed3
Received: from mta.kpnmail.nl (unknown [10.31.161.188])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 9224ddf7-e4d3-11f1-8e5d-005056992ed3;
	Fri, 20 Nov 2026 12:14:36 +0100 (CET)
Received: from mtaoutbound.kpnmail.nl (unknown [10.128.135.189])
	by mta.kpnmail.nl (Halon) with ESMTP
	id 92236a2f-e4d3-11f1-be6a-00505699693e;
	Fri, 20 Nov 2026 12:14:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:message-id:to:from:date;
	bh=PjzVgZGUm3JAnCCIs5JaL2TnGj38tBHNtriCyFT2Wzg=;
	b=ucC4Rj6uJwQLNweeTQfqi5QvjUTh2ZSjBprNMF8X2P5vdvD8C5d2O37pu3+MhBZQxo71p6UH341lH
	 FC8qqlAutWOXQ6+Y+rb5d/oRVfj9l1Dxeqo7ZyWg0LmYnZARgytUII542884wDvHjXS/JttQQEs9DQ
	 bqMVWWHsqJfkuvsPAFknqPjqBKq/uV960BenVIVLFw/0f9337/gPhQ8dAg2ygbeooRtFYl2J8977Th
	 by/FWb6njbth6QBAIVNmLWzVNCyd44uFunmmZAWkIKoLfdFOheCBpe8nVxqu3l2p2c7PXlMetc2oJt
	 VmwaKdVp3/7C5mr39owUglyijb6JNOA==
X-KPN-MID: 33|/sTml7rAee1FVNVLGx5DdW+WHq1K70NfYXOiC57mU469Im1tEq7liCcW2gzjud3
 sG1/yTtbugNy6EpjhTCu4zsvvOuiNdY7N0W34d3Rb7Lk=
X-CMASSUN: 33|NEkO+ZW4M3w9vISEGjQ3s8RjcZG5Ozjt2vMCDXfi8OkgQAwe7HT/MzSsbv+ZWt7
 MR+7TrAKikaX+MKs2lcin9Q==
X-KPN-VerifiedSender: Yes
Received: from cpxoxapps-mh07 (cpxoxapps-mh07.personalcloud.so.kpn.org [10.128.135.213])
	by mtaoutbound.kpnmail.nl (Halon) with ESMTPSA
	id 92199ae0-e4d3-11f1-acfd-00505699eff2;
	Fri, 20 Nov 2026 12:14:36 +0100 (CET)
Date: Fri, 20 Nov 2026 12:14:36 +0100 (CET)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	=?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <ricardo@marliere.net>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <1254980601.2097872.1795173276553@kpc.webmail.kpnmail.nl>
In-Reply-To: <8a436334-d306-4a34-bb7b-efc713aed0f8@linuxfoundation.org>
References: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
 <20261118-kselftest-run-timer-v1-1-53a838b2d62b@xs4all.nl>
 <8a436334-d306-4a34-bb7b-efc713aed0f8@linuxfoundation.org>
Subject: Re: [PATCH 1/3] selftests: use local variables consistently in
 runner.sh
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal


> Op 18-11-2026 11:13 EST schreef Shuah Khan <skhan@linuxfoundation.org>:
> 
>  
> On 11/18/26 06:40, Jori Koolstra (CIQ) wrote:
> > run_one() and run_many() assign their working variables without
> > declaring them local, so they leak into the global namespace of
> > whichever shell sources runner.sh, i.e. run_kselftest.sh or the
> > RUN_TESTS recipe in lib.mk.
> > 
> 
> Hmm. so if a timeout value of say 60 seconds comes from a test
> settings file, does it persist? Can you see that if you run a
> few tests using TARGETS variable?
> 

No, because it is doing

	export kselftest_timeout="$kselftest_default_timeout"

at the start of run_once(). I was just trying to get it to be a bit more
consistent and less bug-prone. We could also add readonly, which is in
POSIX. But that seemed too much.

> > Declare these variables local so that local is used consistently
> > throughout the file and the sourcing shell's namespace is not polluted.
> > This does not add a new requirement on the shell: local is already used
> > in run_many(), in_netns() and run_in_netns().
> 
> Makes sense.
> 
> > 
> > Also, obey the convention to use upper case names for variables that are
> > constant once assigned.
> 
> Can you elaborate on this convention?
> 

It seems to be what was used for runner.sh, local variables set once are in
uppercase.

> I don't want to see these changes combined. We don't combine
> cleanup and convention changes with real changes.
> 

I'll separate it out.

> > 
> > Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
> > ---
> >   tools/testing/selftests/kselftest/runner.sh | 29 ++++++++++++++++++-----------
> >   1 file changed, 18 insertions(+), 11 deletions(-)
> > 
> > diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
> > index 45fb8ec38493..9b1dad5441ea 100644
> > --- a/tools/testing/selftests/kselftest/runner.sh
> > +++ b/tools/testing/selftests/kselftest/runner.sh
> > @@ -58,13 +58,18 @@ tap_timeout()
> >   
> >   run_one()
> >   {
> > +	local DIR TEST BASENAME_TEST BASENAME_SANITIZED SETTINGS TEST_HDR_MSG
> > +	local line field value interpreter stdbuf cmd rc
> > +
> >   	DIR="$1"
> >   	TEST="$2"
> >   
> >   	BASENAME_TEST=$(basename $TEST)
> >   
> >   	# Reset any "settings"-file variables.
> > -	export kselftest_timeout="$kselftest_default_timeout"
> > +	local kselftest_timeout="$kselftest_default_timeout"
> > +	# Make kselftest_timeout variables available to tests
> > +	export kselftest_timeout
> >   
> >   	# Safe default if tr not available
> >   	kselftest_cmd_args_ref="KSELFTEST_ARGS"
> > @@ -91,8 +96,8 @@ run_one()
> >   	fi
> >   
> >   	# Load per-test-directory kselftest "settings" file.
> > -	settings="$BASE_DIR/$DIR/settings"
> > -	if [ -r "$settings" ] ; then
> > +	SETTINGS="$BASE_DIR/$DIR/settings"
> > +	if [ -r "$SETTINGS" ] ; then
> >   		while read line ; do
> >   			# Skip comments.
> >   			if echo "$line" | grep -q '^#'; then
> > @@ -100,8 +105,8 @@ run_one()
> >   			fi
> >   			field=$(echo "$line" | cut -d= -f1)
> >   			value=$(echo "$line" | cut -d= -f2-)
> > -			eval "kselftest_$field"="$value"
> > -		done < "$settings"
> > +			eval "local kselftest_$field"="$value"
> > +		done < "$SETTINGS"
> >   	fi
> >   
> >   	# Command line timeout overrides the settings file
> > @@ -164,8 +169,8 @@ run_one()
> >   
> >   in_netns()
> >   {
> > -	local name=$1
> > -	ip netns exec $name bash <<-EOF
> > +	local NAME=$1
> > +	ip netns exec $NAME bash <<-EOF
> >   		BASE_DIR=$BASE_DIR
> >   		source $BASE_DIR/kselftest/runner.sh
> >   		logfile=$logfile
> > @@ -175,9 +180,9 @@ in_netns()
> >   
> >   run_in_netns()
> >   {
> > -	local tmplog="/tmp/$(mktemp -u ${BASENAME_TEST}-XXXXXX)"
> > -	local netns=$(mktemp -u ${BASENAME_TEST}-XXXXXX)
> > -	local rc
> > +	local tmplog netns rc
> > +	tmplog="/tmp/$(mktemp -u ${BASENAME_TEST}-XXXXXX)"
> > +	netns=$(mktemp -u ${BASENAME_TEST}-XXXXXX)
> >   
> >   	ip netns add $netns
> >   	if [ $? -ne 0 ]; then
> > @@ -198,8 +203,10 @@ run_in_netns()
> >   
> >   run_many()
> >   {
> > +	local DIR TEST BASENAME_TEST
> > +	local pids pid rc
> > +
> >   	DIR="${PWD#${BASE_DIR}/}"
> > -	local rc
> >   	pids=
> >   
> >   	for TEST in "$@"; do
> > 
> 
> thanks,
> -- Shuah
