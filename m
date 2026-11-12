Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794470295;
	b=3tZdoiqujNSRg2JS/xkw4ofbdYsQ2phx5aCQVQK1WBo8zHF4tkxhxLvKDzZvGVsiTN9Z
	 waE9j4mPmaUHjmRaYdpg5Lc2grKARomvOqMWxm0Ygyd4zfBefSxu4t+F5eyd5kwGBGsdi
	 MILT8rc8S+PBv8QsKopQ6oPtJcLVmDQ7Of1iAx/aGawFJ4ZK9CgoYPjWNF5Swsx261NiA
	 Aisor7QFZzORKUpnmeuzaFdBILiXF4ymFkaSx41Gk794GWIig7qoGROaIQUpJxjV+3F9V
	 /y83hG3tn+Z5yd5OMg4rMJtGfikp3MY+qC7dSRQ25WsbdBBr7bD8qYyRm2bdxpjHRgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470295;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=owjWlmr1RZxKH+9vBGpAZpDwjzAy6fCU9wzGVyPy1fU=;
	b=1d893khOjuoVdCqNfrRAxATYZf6kNRW5TKiP/Z9km2qpB0QgUW4RvjAtiC5bnrhDO9Q7
	 su2JC4B62B67F5IjF4Pheas3FYQVs2z/DO8IOaJX2Vr+fSz/xGdiv2LrRoNUL+yXfqbRo
	 v6wKMbvLHOVSo4sNOB/qoaqntWDSrB40pyIh7r70PjpxLgjk4p3J5GdOQdVHUpfXxjcSl
	 lq4YA5DULUbrOYhEePnkIemVdcqndYDwqT8kox+bs/gFdu/w4Lb6Doqva2iccmEeMwqfh
	 9cwKOKAwEnYtP/PCtYnH2/bSgnWXxPp3429kEywqUydJ6/7RBiYf0prvPkHzrpUoEzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ApG+FbZK;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0854606A321;
	Thu, 12 Nov 2026 07:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0854606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ApG+FbZK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ApG+FbZKloocp0D3HIoLNqMTIFuy5z+Pbz178jxh0JcZ8vbMtiTvEA71QTAxHz5rql7Zzn6w34kJu
	 Amr95cRsh0+F/rin4+WNN0ivt2oIxp2yib9MtnjsS6BXArMg89y6Ww6o456ZebCzeMqy6jdNQcvxlY
	 iyqpWR/RkB9kOogc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af571901d7-bb76e;
	Thu, 12 Nov 2026 15:58:10 +0800 (CST)
X-RM-TRANSID:2ee16af571901d7-bb76e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [198.18.0.6] (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26af57191086-f859b;
	Thu, 12 Nov 2026 15:58:10 +0800 (CST)
X-RM-TRANSID:2ee26af57191086-f859b
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: Jin Li <jinli@lanxincomputing.com>, netdev@vger.kernel.org
Cc: Hangbin Liu <liuhangbin@kylinos.cn>, hangbin.liu@linux.dev,
 dsahern@kernel.org, idosch@nvidia.com, shuah@kernel.org, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-kselftest@vger.kernel.org, yana06070@163.com
Subject: Re: [PATCH net v2] selftests: net: forwarding: replace bash brace
 expansion with seq
Date: Thu, 12 Nov 2026 15:58:09 +0800
Message-ID: <1794470289000.677730.6981049676553902648@cmss.chinamobile.com>
In-Reply-To: <20261110024123.535210-1-jinli@lanxincomputing.com>
References: <20261110024123.535210-1-jinli@lanxincomputing.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On 11/10/26 02:41, Jin Li wrote:
> {1..16384} is bash-specific brace expansion and will not work with POSIX
> shells like dash or busybox ash. This breaks the flowlabel test when
> /bin/sh is not bash.

I ran both loop forms under dash and busybox ash. The old form
hands the inner shell a literal {1..16384}, so the loop body runs
once. With the patch it runs all 16384 iterations, and the spliced
$PING6 expands to the same command line as before.

555e5531635a replaced $(seq 1 16384) with {1..16384} in these
three scripts and nowhere else, so the Fixes tag is accurate. The
rest of the forwarding directory has no sh -c call sites.

Reviewed-by: Xia Yan <yanxia@cmss.chinamobile.com>


