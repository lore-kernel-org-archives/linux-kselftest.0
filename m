Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411464;
	b=VH52aI43H5l0+zT50jwWTC1aIhnVPjJpv2djiqMhZzeLsyhbNuilojdMWi4FkN5Kdaom
	 DH+G6lA/RkdhBt+EQiEgnITZRVy9H3iIdpNGUy9LkLLl/m7SbTYW53qB2oBpSCv86UJyl
	 nt+jNXbNtJePCbQXkvU4LkZ9xxbTTYehomhNhsccf4gKmoV9gBJmS+pdeW3HdbaBhMrIy
	 4KVmqd5pEStAi7LKvSLirsEW7Te3IB003XPcqWRq7YBkmSaczXMMxMSJ1t+zvM+uGYvuy
	 TFxF7zITYop6f/YgaYC6J0+uBZ2fjYCQkHVJBUyYJcaWAB+vycLA6G87s52i2YCLXDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=zyPyNsXNnyLp0wiWkbZYu4vFk3ow/rtQP4zegoB1/BA=;
	b=PyG+QO77aEvS5+g/HOMBeQ4m7h90x6YA1wKUE2lrxioNYOF4WHGlrZJVVoi62cEmYpxi
	 bYwCY2nHqcbyMqbodgNQSHGkB3Kx7DqOJ0MeLIN3SBSRcNavWJfN3Hg5jWlxwlWNpA7Mh
	 MWXbvtINMEtrO/vyVayUVv9XOIfkkSZNXO/aVc5pfOf+Z2ODk0kZDJx3SRy0S2WYnYQYc
	 21aekumicwkD7yGld4SSZjbcy/Rd4O/b/md8SPErUK+DHhzF75qzPabfYuUbgavhse1U6
	 7JKBmidOAqdk+3MTaWL67JiMhlufgUGxKS10LsvlUwQOp3V5UQu7ngmuVsDQC+iNOdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=KSuOhJwR;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7CD606A326
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 15:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C7CD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=KSuOhJwR
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9828fee1b4bso838807241.3
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 07:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794411462; x=1795016262; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zyPyNsXNnyLp0wiWkbZYu4vFk3ow/rtQP4zegoB1/BA=;
        b=KSuOhJwRVn6ezxXqsCVqq2eIvk3Dh/kvI46PwVUnLm7knleX/h46MK9EnsyzF2uPT2
         8znC4z0CgZzu0GCKZGNR5klElinZk1//9/Vo6D1XDoyvdj1n2JDddPbgLuO1ItUhXQYP
         ih1bhIB6EifntfuJRr1WuPoN9tze2Dpqo+wdyf7oqdDFcB4//nHcro2M8WIA8EGgKRJ7
         V0/u59fnHK2FeHAX3ugQvtmuvbdXBh3QXpHv5I49SsH2WX6vIJ8+r82opWYWS5wP43oQ
         CgvLb+EGw3c1cWJmX3IjDt+tT0oCUJB09UIjYquFsegJVlnjvDZl1t5TF38O4xHJVPmo
         rYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411462; x=1795016262;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zyPyNsXNnyLp0wiWkbZYu4vFk3ow/rtQP4zegoB1/BA=;
        b=n1NvtiUAVxBhgycsmfNf7iYKvM6AjUQ1KZOabvL7Jyvm00frivbRpR2AnX1oH7CGE8
         LGbUiCVgN1VNIWT3B11HHhJiqV8oFtHqw59aVMA+LcyfqrD4SmlkZvcHd7knQwKCCQAt
         IGUW/alxp8laMiih8L7axU25n/cQzjs88lta8lSrXiF0NFPMH1aPcRBCtPisE5H16IP5
         zQYX/YIXCP6YHwWk/FSe6oyvkycKJ5Jkrzkp7YdaBnqHSd+rxflPw+2G52KID+TZgVNS
         HfBgUyMxnNYR4DP9iP2wvjM/lyxjK1MjwIGwd7qcm4zZ1IYptGpvX3cxRkY6TLrY6kZL
         n4ZQ==
X-Gm-Message-State: APuU4Z9ikgpJSRJG4Xm3Hh3Yr/NECO4Aphyt3+VRGb5QXJAZ8lmDwtLR
	KJ4J1p+jphW40uA4W0yWCIuq9LjrlT6WorAA912AKbWswl0rvT0Lmxm0MpsnqYL7xjxeii5WqTN
	gEVAb
X-Gm-Gg: AYBFou1ymnkouUclxTdsmFvZFSRZAiHl1pusJ3vQcC6qvn8U/cLMI5io9MescnBAr7t
	oXIGVL0O4a3eyT4vpV+3R8HZeBpw266BuW8nEtnKOMeuyiGtRLiOw0lORKiMfhYawD8eLd7dlzs
	6Q1BZfqkKzAO6OZK4KA86F8VnsH7/20t+G/ayuhg4i492GLTNB+g4QiG38X0pszKw9sQgcySzZK
	21oypfzHYRS2ddYYfRgX7IWUKj5iRMMbxiIW93etfqp48XbEUHZkPYsg/OMfrL1qmfik99Fc2Gf
	XpNQGW4JAEsiSVS0r0T5V84ZLxO5RZEveoNpL3bmTY1m7sG6o98TEZ09pBUBPSCv89BJp8WSGDN
	hfSZ/Zj1/oVUq7FZhgsBb98WQ/Qso6qJq75SVAutzT0o6BxMBpIB+m28uDqzxd8XpwzbHPkXDo/
	Lj3OJHz9nrvTbPh/ZH1e4YZXna+jZKb9AX/9yc2rMMiD+N4tYJpO03rKTKrCpW1V8SxorfC50P1
	rZsL9FQdBSRxgx0m3ly0tDLrAtR6dHlMjA5WD1IMRsHS87FQ43KOHI6K6B8JC85trjSG/1NEXbx
	gP9OA+W7JjwpNeviTiGQiJvzm7j4g3fuk4BJy9Ra8fvA+L+uazHUpb5vvW/tSl3gB0JFJcmLlRr
	DTqaBsBSu5Rc27/hhLMgCGTguuYcoadRi
X-Received: by 2002:a05:6102:6f06:b0:7c3:9059:49c2 with SMTP id ada2fe7eead31-7d50609f040mr768713137.22.1794411461945;
        Wed, 11 Nov 2026 07:37:41 -0800 (PST)
Received: from localhost (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d3023aeac7sm3957545137.9.2026.11.11.07.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 07:37:41 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 10:37:40 -0500
Message-Id: <DMSHRWYSS8FJ.2H4W2E388G00V@soleen.com>
Cc: <linux-kselftest@vger.kernel.org>, <shuah@kernel.org>,
 <linux-mm@kvack.org>, <skhan@linuxfoundation.org>,
 <linux-doc@vger.kernel.org>, <vipinsh@google.com>,
 <linux-kernel@vger.kernel.org>, <corbet@lwn.net>, <dmatlack@google.com>,
 <kexec@lists.infradead.org>, <pratyush@kernel.org>,
 <rdunlap@infradead.org>, <graf@amazon.com>
Subject: Re: [PATCH v5 3/6] liveupdate: luo: serialize sessions via
 per-session publish helper
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Mike Rapoport" <rppt@kernel.org>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
 <20261105050053.3063001-4-pasha.tatashin@soleen.com>
 <179439592040.425130.1571434550510654411.b4-review@b4>
In-Reply-To: <179439592040.425130.1571434550510654411.b4-review@b4>

On Wed Nov 11, 2026 at 6:18 AM EST, Mike Rapoport wrote:
> Hi,
>
>> With incremental kho_block publication in place, LUO sessions can be
>> published into sh->block_set individually as they are committed, rather
>> than rebuilding the entire session serialization chain during reboot.
>>=20
>> Currently, luo_session_serialize() resets *sh->sessions_pa and
>> serializes all outgoing sessions from scratch in a single pass at reboot
>> time.
>>=20
>> Introduce luo_session_publish_one() to append a session's
>> luo_session_ser entry via kho_block_set_it_append() and move the session
>> onto sh->published_list. Update luo_session_serialize() to freeze all
>> remaining unpublished sessions first (rolling back via
>> luo_session_unfreeze_one() on failure) and then publish them in a second
>> pass.
>>=20
>> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>> ---
>>  kernel/liveupdate/luo_session.c | 92 ++++++++++++++++++++++-----------
>>  1 file changed, 63 insertions(+), 29 deletions(-)
>>
>> diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_ses=
sion.c
>> index 6dea359111818..caf0e85081e87 100644
>> --- a/kernel/liveupdate/luo_session.c
>> +++ b/kernel/liveupdate/luo_session.c
>> @@ -103,20 +103,30 @@
>>  static DECLARE_RWSEM(luo_session_serialize_rwsem);
>>  /**
>>   * struct luo_session_header - Header struct for managing LUO sessions.
>> - * @count:       The number of sessions currently tracked in the @list.
>> + * @count:       The number of sessions currently tracked in the header=
.
>> + * @published_count: The number of outgoing sessions currently publishe=
d in
>> + *                   @block_set.
>>   * @list:        The head of the linked list of `struct luo_session` in=
stances.
>
> Add "yet unpublished" to the description?

Yeap, will clarify list holds yet-unserialized sessions.

>> + * @published_list:  The head of the linked list of published outgoing
>> + *                   sessions, ordered identically to their entries in
>> + *                   @block_set.
>>   * @rwsem:       A read-write semaphore providing synchronized access t=
o the
>>   *               session list and other fields in this structure.
>>   * @block_set:   The set of serialization blocks.
>> + * @it:          Iterator tracking the next slot in @block_set for outg=
oing
>> + *               session serialization.
>>   * @sessions_pa: Points to the location of sessions_pa within struct lu=
o_ser.
>>   * @active:      Set to true when first initialized. If previous kernel=
 did not
>>   *               send session data, active stays false for incoming.
>>   */
>>  struct luo_session_header {
>>  	long count;
>> +	long published_count;
>>  	struct list_head list;
>> +	struct list_head published_list;
>>  	struct rw_semaphore rwsem;
>>  	struct kho_block_set block_set;
>> +	struct kho_block_set_it it;
>>  	u64 *sessions_pa;
>>  	bool active;
>>  };
>> @@ -134,12 +144,14 @@ struct luo_session_global {
>>  static struct luo_session_global luo_session_global =3D {
>>  	.incoming =3D {
>>  		.list =3D LIST_HEAD_INIT(luo_session_global.incoming.list),
>> +		.published_list =3D LIST_HEAD_INIT(luo_session_global.incoming.publis=
hed_list),
>>  		.rwsem =3D __RWSEM_INITIALIZER(luo_session_global.incoming.rwsem),
>>  		.block_set =3D KHO_BLOCK_SET_INIT(luo_session_global.incoming.block_s=
et,
>>  						sizeof(struct luo_session_ser)),
>>  	},
>>  	.outgoing =3D {
>>  		.list =3D LIST_HEAD_INIT(luo_session_global.outgoing.list),
>> +		.published_list =3D LIST_HEAD_INIT(luo_session_global.outgoing.publis=
hed_list),
>>  		.rwsem =3D __RWSEM_INITIALIZER(luo_session_global.outgoing.rwsem),
>>  		.block_set =3D KHO_BLOCK_SET_INIT(luo_session_global.outgoing.block_s=
et,
>>  						sizeof(struct luo_session_ser)),
>> @@ -186,6 +198,10 @@ static int luo_session_insert(struct luo_session_he=
ader *sh,
>>  		if (!strncmp(it->name, session->name, sizeof(it->name)))
>>  			return -EEXIST;
>>  	}
>> +	list_for_each_entry(it, &sh->published_list, list) {
>> +		if (!strncmp(it->name, session->name, sizeof(it->name)))
>> +			return -EEXIST;
>> +	}
>> =20
>>  	/*
>>  	 * For outgoing we should make sure there is room in serialization arr=
ay
>> @@ -203,6 +219,42 @@ static int luo_session_insert(struct luo_session_he=
ader *sh,
>>  	return 0;
>>  }
>> =20
>> +static void luo_session_publish_one(struct luo_session *session)
>> +{
>> +	struct luo_session_header *sh =3D &luo_session_global.outgoing;
>> +	struct luo_session_ser entry =3D {};
>> +
>> +	lockdep_assert_held_write(&sh->rwsem);
>> +	lockdep_assert_held(&session->mutex);
>> +
>> +	if (!sh->active || !sh->sessions_pa)
>> +		return;
>> +
>> +	if (!sh->published_count)
>> +		kho_block_set_it_init(&sh->it, &sh->block_set);
>> +
>> +	strscpy(entry.name, session->name, sizeof(entry.name));
>> +	entry.file_set_ser.count =3D session->file_set.count;
>> +	entry.file_set_ser.files =3D
>> +		kho_block_set_head_pa(&session->file_set.block_set);
>> +
>> +	/* This should not fail normally as blocks were pre-allocated */
>> +	if (WARN_ON_ONCE(!kho_block_set_it_append(&sh->it, &entry)))
>> +		return;
>> +
>> +	if (!sh->published_count) {
>> +		/*
>> +		 * Ensure the first block header and entry are visible before
>> +		 * publishing sessions_pa to concurrent KHO readers.
>> +		 */
>> +		smp_store_release(sh->sessions_pa,
>> +				  kho_block_set_head_pa(&sh->block_set));
>> +	}
>
>
>> +
>> +	list_move_tail(&session->list, &sh->published_list);
>> +	sh->published_count++;
>> +}
>> +
>>  static void luo_session_remove(struct luo_session_header *sh,
>>  			       struct luo_session *session)
>>  {
>> @@ -636,50 +688,32 @@ int luo_session_deserialize(void)
>>  int luo_session_serialize(void)
>>  {
>>  	struct luo_session_header *sh =3D &luo_session_global.outgoing;
>> -	struct luo_session *session;
>> -	struct kho_block_set_it it;
>> +	struct luo_session *session, *tmp;
>>  	int err;
>> =20
>>  	down_write(&luo_session_serialize_rwsem);
>>  	down_write(&sh->rwsem);
>> -	*sh->sessions_pa =3D 0;
>> -
>> -	kho_block_set_it_init(&it, &sh->block_set);
>> =20
>>  	list_for_each_entry(session, &sh->list, list) {
>> -		struct luo_session_ser *ser =3D kho_block_set_it_reserve_entry(&it);
>> -
>> -		/* This should not fail normally as blocks were pre-allocated */
>> -		if (WARN_ON_ONCE(!ser)) {
>> -			err =3D -ENOSPC;
>> -			goto err_undo;
>> -		}
>> -
>>  		err =3D luo_session_freeze_one(session);
>>  		if (err) {
>> -			kho_block_set_it_prev(&it);
>> -			goto err_undo;
>> +			list_for_each_entry_continue_reverse(session, &sh->list, list)
>> +				luo_session_unfreeze_one(session);
>> +			goto err_unlock;
>
> Why goto err_ can do this?
> I really prefer to avoid error handling inside if (err) blocks whenever
> possible.

Makes sense, will move it.

>
>>  		}
>> +	}
>> =20
>> -		strscpy(ser->name, session->name, sizeof(ser->name));
>> -		ser->file_set_ser.count =3D session->file_set.count;
>> -		ser->file_set_ser.files =3D
>> -			kho_block_set_head_pa(&session->file_set.block_set);
>> +	list_for_each_entry_safe(session, tmp, &sh->list, list) {
>> +		mutex_lock(&session->mutex);
>> +		luo_session_publish_one(session);
>
> And running a loop of _publish() in _serialize() makes my bikeshedding
> argument stronger ;-)

+1, will fix it in v6.

--=20
Pasha

