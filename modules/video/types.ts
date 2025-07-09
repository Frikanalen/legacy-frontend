import { OrganizationData } from "modules/organization/resources/Organization";

export type VideoData = {
  id: number;
  name: string;
  header: string;
  organization: OrganizationData;
  ogv_url: string;
  created_time: string;
  files: {
    large_thumb: string;
  };
};

export type VideoCategoryData = {
  id: number;
  name: string;
  desc: string;
  videocount: number;
};

export type VideoUploadTokenData = {
  upload_token: string;
  upload_url: string;
};
