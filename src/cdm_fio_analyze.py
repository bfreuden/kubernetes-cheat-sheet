import sys
import json

result = sys.argv[1]
with open(result) as f:
    content = f.readlines()
content = [x for x in content if not x.startswith("#")]
result_dict = json.loads(" ".join(content))

job = [job for job in result_dict["jobs"] if job["jobname"] == "Seqread"][0]["read"]
Seqread = job["bw"] // 1024
SeqreadIOPS = round(job["iops"])
job = [job for job in result_dict["jobs"] if job["jobname"] == "Seqwrite"][0]["write"]
Seqwrite = job["bw"] // 1024
SeqwriteIOPS = round(job["iops"])

job = [job for job in result_dict["jobs"] if job["jobname"] == "512kread"][0]["read"]
F12KR = job["bw"] // 1024
F12KRIOPS = round(job["iops"])
job = [job for job in result_dict["jobs"] if job["jobname"] == "512kwrite"][0]["write"]
F12KW = job["bw"] // 1024
F12KWIOPS = round(job["iops"])

job = [job for job in result_dict["jobs"] if job["jobname"] == "SeqQ32T1read"][0]["read"]
SEQ32R = job["bw"] // 1024
SEQ32RIOPS = round(job["iops"])
job = [job for job in result_dict["jobs"] if job["jobname"] == "SeqQ32T1write"][0]["write"]
SEQ32W = job["bw"] // 1024
SEQ32WIOPS = round(job["iops"])

job = [job for job in result_dict["jobs"] if job["jobname"] == "4kread"][0]["read"]
FKR = job["bw"] // 1024
FKRIOPS = round(job["iops"])
job = [job for job in result_dict["jobs"] if job["jobname"] == "4kwrite"][0]["write"]
FKW = job["bw"] // 1024
FKWIOPS = round(job["iops"])

job = [job for job in result_dict["jobs"] if job["jobname"] == "4kQ32T1read"][0]["read"]
FK32R = job["bw"] // 1024
FK32RIOPS = round(job["iops"])
job = [job for job in result_dict["jobs"] if job["jobname"] == "4kQ32T1write"][0]["write"]
FK32W = job["bw"] // 1024
FK32WIOPS = round(job["iops"])

FK8R = 0
FK8RIOPS = 0
for job in result_dict["jobs"]:
    if job["jobname"] == "4kQ8T8read":
        FK8R += job["read"]["bw"]
        FK8RIOPS += job["read"]["iops"]
FK8R = FK8R // 1024
FK8RIOPS = round(FK8RIOPS)

FK8W = 0
FK8WIOPS = 0
for job in result_dict["jobs"]:
    if job["jobname"] == "4kQ8T8write":
        FK8W += job["write"]["bw"]
        FK8WIOPS += job["write"]["iops"]
FK8W = FK8W // 1024
FK8WIOPS = round(FK8WIOPS)

# FK8W = [job for job in result_dict["jobs"] if job["jobname"] == "4kQ8T8write"][0]["write"]["bw"] // 1024

print(f"Sequential Read: {Seqread} MB/s IOPS={SeqreadIOPS}")
print(f"Sequential Write: {Seqwrite} MB/s IOPS={SeqwriteIOPS}")
print()

print(f"512KB Read: {F12KR} MB/s IOPS={F12KRIOPS}")
print(f"512KB Write: {F12KW} MB/s IOPS={F12KWIOPS}")
print()

print(f"Sequential Q32T1 Read: {SEQ32R} MB/s IOPS={SEQ32RIOPS}")
print(f"Sequential Q32T1 Write: {SEQ32W} MB/s IOPS={SEQ32WIOPS}")
print()

print(f"4KB Read: {FKR} MB/s IOPS={FKRIOPS}")
print(f"4KB Write: {FKW} MB/s IOPS={FKWIOPS}")
print()

print(f"4KB Q32T1 Read: {FK32R} MB/s IOPS={FK32RIOPS}")
print(f"4KB Q32T1 Write: {FK32W} MB/s IOPS={FK32WIOPS}")
print()

print(f"4KB Q8T8 Read: {FK8R} MB/s IOPS={FK8RIOPS}")
print(f"4KB Q8T8 Write: {FK8W} MB/s IOPS={FK8WIOPS}")
print()
