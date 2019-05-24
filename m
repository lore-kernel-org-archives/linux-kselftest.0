From: fklassen@appneta.com (Fred Klassen)
Date: Thu, 23 May 2019 18:27:41 -0700
Subject: [PATCH net 4/4] net/udpgso_bench_tx: audit error queue
In-Reply-To: <CAF=yD-KBNLr5KY-YQ1KMmZGCpYNefSJKaJkZNOwd8nRiedpQtA@mail.gmail.com>
References: <20190523210651.80902-1-fklassen@appneta.com>
 <20190523210651.80902-5-fklassen@appneta.com>
 <CAF=yD-KBNLr5KY-YQ1KMmZGCpYNefSJKaJkZNOwd8nRiedpQtA@mail.gmail.com>
Message-ID: <D68C643B-C6A4-4EC5-8E4F-368BDE03760B@appneta.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190524012741.pmJxGoGjX6DSsP40gGLcPjPT6hrUB9RbKADDff_BSKs@z>

Willem, this is only my 2nd patch, and my last one was a one liner.
I’ll try to work through this, but let me know if I am doing a rookie
mistake (learning curve and all).


> On May 23, 2019,@2:56 PM, Willem de Bruijn <willemdebruijn.kernel@gmail.com> wrote:
> 
> On Thu, May 23, 2019@5:11 PM Fred Klassen <fklassen@appneta.com> wrote:
>> 
>> This enhancement adds the '-a' option, which will count all CMSG
>> messages on the error queue and print a summary report.
>> 
>> Fixes: 3a687bef148d ("selftests: udp gso benchmark")
> 
> Also not a fix, but an extension.

I’ll make a v2 patch and remove “Fixes:".

> 
>> 
>> Example:
>> 
>>    # ./udpgso_bench_tx -4uT -a -l5 -S 1472 -D 172.16.120.189
>>    udp tx:    492 MB/s     8354 calls/s   8354 msg/s
>>    udp tx:    477 MB/s     8106 calls/s   8106 msg/s
>>    udp tx:    488 MB/s     8288 calls/s   8288 msg/s
>>    udp tx:    882 MB/s    14975 calls/s  14975 msg/s
>>    Summary over 5.000 seconds ...
>>    sum udp tx:    696 MB/s      57696 calls (11539/s)  57696 msgs (11539/s)
>>    Tx Timestamps: received:     57696   errors: 0
>> 
>> This can be useful in tracking loss of messages when under load. For example,
>> adding the '-z' option results in loss of TX timestamp messages:
>> 
>>    # ./udpgso_bench_tx -4ucT -a -l5 -S 1472 -D 172.16.120.189 -p 3239 -z
>>    udp tx:    490 MB/s     8325 calls/s   8325 msg/s
>>    udp tx:    500 MB/s     8492 calls/s   8492 msg/s
>>    udp tx:    883 MB/s    14985 calls/s  14985 msg/s
>>    udp tx:    756 MB/s    12823 calls/s  12823 msg/s
>>    Summary over 5.000 seconds ...
>>    sum udp tx:    657 MB/s      54429 calls (10885/s)  54429 msgs (10885/s)
>>    Tx Timestamps: received:     34046   errors: 0
>>    Zerocopy acks: received:     54422   errors: 0
> 
> This would probably also be more useful as regression test if it is in
> the form of a pass/fail test: if timestamps are requested and total
> count is zero, then the feature is broken and the process should exit
> with an error.
> 

I’ll add a hard failure for zero response for TX Timestamps or Zerocopy,
or if any errors occur.


>> 
>> Fixes: 3a687bef148d ("selftests: udp gso benchmark")
> 
> Repeated

Will fix.
> 
>> Signed-off-by: Fred Klassen <fklassen at appneta.com>
>> ---
>> tools/testing/selftests/net/udpgso_bench_tx.c | 152 +++++++++++++++++++-------
>> 1 file changed, 113 insertions(+), 39 deletions(-)
>> 
>> diff --git a/tools/testing/selftests/net/udpgso_bench_tx.c b/tools/testing/selftests/net/udpgso_bench_tx.c
>> index 56e0d890b066..9924342a0b03 100644
>> --- a/tools/testing/selftests/net/udpgso_bench_tx.c
>> +++ b/tools/testing/selftests/net/udpgso_bench_tx.c
>> @@ -62,10 +62,19 @@ static bool cfg_tcp;
>> static uint32_t        cfg_tx_ts = SOF_TIMESTAMPING_TX_SOFTWARE;
>> static bool    cfg_tx_tstamp;
>> static uint32_t        cfg_tos;
>> +static bool    cfg_audit;
>> static bool    cfg_verbose;
>> static bool    cfg_zerocopy;
>> static int     cfg_msg_nr;
>> static uint16_t        cfg_gso_size;
>> +static unsigned long total_num_msgs;
>> +static unsigned long total_num_sends;
>> +static unsigned long stat_tx_ts;
>> +static unsigned long stat_tx_ts_errors;
>> +static unsigned long tstart;
>> +static unsigned long tend;
>> +static unsigned long stat_zcopies;
>> +static unsigned long stat_zcopy_errors;
>> 
>> static socklen_t cfg_alen;
>> static struct sockaddr_storage cfg_dst_addr;
>> @@ -137,8 +146,11 @@ static void flush_cmsg(struct cmsghdr *cmsg)
>>                        struct my_scm_timestamping *tss;
>> 
>>                        tss = (struct my_scm_timestamping *)CMSG_DATA(cmsg);
>> -                       fprintf(stderr, "tx timestamp = %lu.%09lu\n",
>> -                               tss->ts[i].tv_sec, tss->ts[i].tv_nsec);
>> +                       if (tss->ts[i].tv_sec == 0)
>> +                               stat_tx_ts_errors++;
>> +                       if (cfg_verbose)
>> +                               fprintf(stderr, "tx timestamp = %lu.%09lu\n",
>> +                                       tss->ts[i].tv_sec, tss->ts[i].tv_nsec);
> 
> changes unrelated to this feature?

I’ll remove. Do you think that I should pull out any messages related
to “cfg_verbose”? 
