Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn [202.108.3.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97B5268690
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 07:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787125842; cv=none; b=TQdRaSr5Tan9JwiJdFeYi3oaw0T4bAQLk4h7jb3pA7C41R9DoGSmF13FEALQAeAs5JjXDut/9mG5dYPAG1fsjO0TtakI6CYxscykpFg0qOuiB/HvZ39crwFWZ0Te5aDijv8CTSy3D9KGDFd1xMJw53WPcYWqPkHOGtX+Bmp+bT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787125842; c=relaxed/simple;
	bh=Vj6bKvPVanImAvTzMWi9v8b7811Dvebo8JzMtRQ06ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K6hI1HYq87+R1UVZC+8BVejZvYW38WyctLcxIpg49Fl1OmOia0+5S646cMlu7QwyQ7DqDW/RB65QuL5ty0/P916wLQMDiin0Hz8B7NVkM7jJ+wcgBPA6LL5PTDUPBwWSjZmUO8VnboANy9320MaUS8DRxAbe+Kywc568p87yp54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=lNBN05z6; arc=none smtp.client-ip=202.108.3.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="lNBN05z6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787125838;
	bh=/NoTKKuFF5StMAU2PMDAleDSrfl6HpFKVhQNEb/s+uU=;
	h=From:Subject:Date:Message-ID;
	b=lNBN05z6gPrAKNsmQHymqXjdjakyl1QlgeadmUGsmbS40L7MdwZobqIe/67uVzdAW
	 R5gky3aPDeoKZW71hRc+wFVtHlgo3Oo5OPtFn9aMDL+qHOubOl9p7ASo1t+RDJZS/N
	 h/r+v/Feamu/i/IKCwIL9+RCCYggywtxiqd919qU=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([221.216.154.155])
	by sina.com (10.54.253.33) with ESMTP
	id 6A85604000005E03; Wed, 19 Aug 2026 15:50:27 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 9678076685555
X-SMAIL-UIID: F86035B62FA84ED8A37056820DE5ECB6-20260819-155027-1
From: Hillf Danton <hdanton@sina.com>
To: Junjie Cao <junjie.cao@intel.com>
Cc: Eric Dumazet <edumazet@google.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Uladzislau Zhauniarovich <uladzislau.zhauniarovich@gmail.com>,
	syzbot+19d01f6082ec61dd45b2@syzkaller.appspotmail.com,
	syzbot+8785aaf121cfb2141e0d@syzkaller.appspotmail.com,
	syzbot+2642f347f7309b4880dc@syzkaller.appspotmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 1/3] net/sched: taprio: catch up in bounded time when the schedule falls behind
Date: Wed, 19 Aug 2026 15:50:14 +0800
Message-ID: <20260819075015.1259-1-hdanton@sina.com>
In-Reply-To: <20260818071706.251035-2-junjie.cao@intel.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 18 Aug 2026 15:17:04 +0800 Junjie Cao wrote:
> @@ -960,14 +1005,19 @@ static enum hrtimer_restart advance_sched(struct hrtimer *timer)
>  		next = list_next_entry(entry, list);
>  	}
>  
> -	end_time = ktime_add_ns(entry->end_time, next->interval);
> +	next_start = entry->end_time;
> +	end_time = ktime_add_ns(next_start, next->interval);
>  	end_time = min_t(ktime_t, end_time, oper->cycle_end_time);
>  
> +	now = taprio_get_time(q);
> +	if (unlikely(ktime_before(end_time, now)))
> +		taprio_catch_up(oper, &next, &next_start, &end_time, now);
> +
If now is computed based on the timer instead, now = timer->base->get_time(),
which one do you pick up lad/dude?
