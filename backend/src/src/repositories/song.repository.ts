import SongEntity from '../entities/song.entity';
import BaseRepository from './base.repository';

class SongRepository extends BaseRepository<SongEntity> {
  constructor() {
    super('songs');
  }

  public async getSongs(): Promise<SongEntity[]> {
    return await this.findAll();
  }

  public async getSong(id: string): Promise<SongEntity | null> {
    return await this.findOne((item) => item.id === id);
  }

  public async createSong(data: SongEntity): Promise<SongEntity> {
    return await this.add(data);
  }

  public async updateSong(
    id: string,
    data: SongEntity
  ): Promise<SongEntity | null> {
    return await this.update((item) => item.id === id, data);
  }

  public async deleteSong(id: string): Promise<void> {
    await this.delete((item) => item.id !== id);
  }
}

export default SongRepository;
