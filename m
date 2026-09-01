Received: from mta0.migadu.com (out-123.mta0.migadu.com [91.218.175.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0AE4772A1
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 09:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255988; cv=none; b=DavFZi6RQG18k2jOF8E8Af9rkRWORk38YAA54UVmcs9jmEgrZXccH0SjN5ddPPlAkXjYH/olpB2KxTbXVEr16AGV6ySLxVY0FJ3amoaxseU2jvLNBHoLC+282nOf4G3MqTt+TX5NHhAqrh/4rrJRMc7JjEm5kMjQRv4VlltGADk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255988; c=relaxed/simple;
	bh=J56Av4c33bDOvLiAcmG++5W+dcoUgYpDSIJRZv0VUgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOx1P2X/qLVIbfGQ0lqgHY1AAECx3S3kir0m2YZaIVJenjFR8iVW6aVIeRTf3G5DetGLab6A2cCcwc677xswB7R3hL4GaKaufVcjg1PiQOdjJgH7GhhCgLCYwXcC0eUDwF6eNo3za9nu/J17xlHUbA2ggjlhxhCg4QW5ZW04qZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BDUUYBIa; arc=none smtp.client-ip=91.218.175.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BDUUYBIa"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=J56Av4c33bDOvLiAcmG++5W+dcoUgYpDSIJRZv0VUgM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788255984; v=1; x=1788860784;
 b=BDUUYBIa3Yeap2rbE3tE4r7jztdrtY0kuhaQW+1GXSQWvaSSPz2DPYKWt/khS4H+LIGrx2f9
 ZvE2hcP6403Y87k3AfrR3UfSxzmQ+O7Mu2Xx6caK08nt496C1XjKrod+UJycllG1xU3ZPW15Dn2
 CjxbirnOeNJD+N7b5UWHlBFU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2a80c8888dc7dbf4;
	Tue, 01 Sep 2026 09:46:24 +0000
X-Mizu-Trace-ID: 2a80c8888dc7dbf4
X-Migadu-Flow: FLOW_OUT
Date: Tue, 1 Sep 2026 17:46:14 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Qianheng Peng <pengqh1@chinatelecom.cn>
Cc: shuah@kernel.org, broonie@kernel.org, jackmanb@google.com,
	liuhangbin@gmail.com, rbm@suse.com, skhan@linuxfoundation.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: runner.sh: avoid overriding
 kselftest_cmd_args with empty variable
Message-ID: <apae5q5R546M6283@fedora>
References: <1784010883-25386-1-git-send-email-pengqh1@chinatelecom.cn>
 <20260901024452.485159-1-pengqh1@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901024452.485159-1-pengqh1@chinatelecom.cn>

Hi Qianheng
On Tue, Sep 01, 2026 at 10:44:52AM +0800, Qianheng Peng wrote:
> On Tue, 14 Jul 2026 14:34:43, Qianheng Peng wrote:
> >Normally the value of kselftest_cmd_args can be read from settings file,
> >but it will be overridden by KSELFTEST_TEST_KMOD_SH_ARGS which can be
> >empty if user did not give it a real value.So it should be better to
> >check if KSELFTEST_TEST_KMOD_SH_ARGS is emty before referring its
> >value to kselftest_cmd_args.

Where does KSELFTEST_TEST_KMOD_SH_ARGS from? kmod testing? If yes,
can we fix it there?

Thanks
Hangbin

> >
> >Signed-off-by: QianhengPeng <pengqh1@chinatelecom.cn>
> >---
> > tools/testing/selftests/kselftest/runner.sh | 10 +++++++++-
> > 1 file changed, 9 insertions(+), 1 deletion(-)
> >
> >diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
> >index 311811d..a99147a 100644
> >--- a/tools/testing/selftests/kselftest/runner.sh
> >+++ b/tools/testing/selftests/kselftest/runner.sh
> >@@ -103,6 +103,15 @@ run_one()
> > 		ktap_print_msg "timeout set to $kselftest_timeout" >> "$logfile"
> > 	fi
> > 
> >+	# Exported environment variable overrides the settings file
> >+	eval kselftest_eval_cmd_args="\$${kselftest_cmd_args_ref:-}"
> >+	if [ -n "$kselftest_eval_cmd_args" ]; then
> >+		kselftest_cmd_args=$kselftest_eval_cmd_args
> >+		ktap_print_msg "overriding cmd_args to $kselftest_cmd_args" >> "$logfile"
> >+	elif [ -n "$kselftest_cmd_args" ]; then
> >+		ktap_print_msg "cmd_args set to $kselftest_cmd_args" >> "$logfile"
> >+	fi
> >+
> > 	TEST_HDR_MSG="selftests: $DIR: $BASENAME_TEST"
> > 	echo "# $TEST_HDR_MSG"
> > 	if [ ! -e "$TEST" ]; then
> >@@ -113,7 +122,6 @@ run_one()
> > 		if [ -x /usr/bin/stdbuf ]; then
> > 			stdbuf="/usr/bin/stdbuf --output=L "
> > 		fi
> >-		eval kselftest_cmd_args="\$${kselftest_cmd_args_ref:-}"
> > 		if [ -x "$TEST" ]; then
> > 			cmd="$stdbuf ./$BASENAME_TEST $kselftest_cmd_args"
> > 		elif [ -x "./ksft_runner.sh" ]; then
> >-- 
> >1.8.3.1
> >
> 
> Gentle ping. This patch has been sent on July and has not got response since then.
> The patch still applies cleanly to current mainline.Glad to resend if it's preferable.
> 
> Thanks and Regards,
> Qianheng
